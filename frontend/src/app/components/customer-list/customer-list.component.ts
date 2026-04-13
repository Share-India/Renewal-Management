import { Component, Input, Output, EventEmitter } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { ApiService } from '../../services/api.service';
import { AuthService } from '../../services/auth.service';

@Component({
    selector: 'app-customer-list',
    standalone: true,
    imports: [CommonModule, FormsModule],
    templateUrl: './customer-list.component.html',
    styleUrls: ['./customer-list.component.css']
})
export class CustomerListComponent {
    @Input() policies: any[] = [];
    @Input() loading: boolean = false;
    @Input() isAdmin: boolean = false;
    @Output() dataUpdated = new EventEmitter<void>();

    selectedPolicy: any = null;
    selectedPolicyDetails: any = null;
    showLogCallModal: boolean = false;
    showDetailsModal: boolean = false;

    // Form fields
    callNotes: string = '';
    callOutcome: string = 'Interested';
    nextFollowUp: string = '';

    // Call History
    showHistoryModal: boolean = false;
    callHistory: any[] = [];
    loadingHistory: boolean = false;
    selectedHistoryPolicy: any = null;
    selectedRenewalPolicy: any = null;

    // Renewal Logic
    showRenewalModal: boolean = false;
    renewalForm: any = { customer: { dob: '' } };
    selectedPaymentFile: File | null = null;

    onPaymentFileSelected(event: any) {
        this.selectedPaymentFile = event.target.files[0];
    }

    constructor(private apiService: ApiService, private authService: AuthService) { }

    openDetailsModal(policy: any) {
        // Show modal immediately with cached data for responsiveness
        this.selectedPolicyDetails = policy;
        this.showDetailsModal = true;
        this.isEditing = false;

        // Fetch latest version from server to ensure fresh data
        this.apiService.getPolicyById(policy.id).subscribe({
            next: (freshPolicy) => {
                this.selectedPolicyDetails = freshPolicy;
                console.log('Policy details refreshed from server');
            },
            error: (err) => console.error('Error refreshing policy details:', err)
        });
    }

    closeDetailsModal() {
        this.showDetailsModal = false;
        this.selectedPolicyDetails = null;
    }

    get canEditPolicy(): boolean {
        return this.authService.hasRole('ADMIN') || this.authService.hasRole('MIS');
    }

    get canViewSensitiveInfo(): boolean {
        // Hide PAN and GST for RENEWER role
        if (this.authService.hasRole('RENEWER')) {
            return false;
        }
        return this.authService.hasRole('ADMIN') ||
            this.authService.hasRole('MIS') ||
            this.authService.hasRole('POLICY_ISSUANCE') ||
            this.authService.hasRole('POLICY ISSUANCE');
    }

    get isMotorPolicy(): boolean {
        if (!this.selectedPolicyDetails) return false;

        const type = (this.selectedPolicyDetails.type || '').toLowerCase();
        const insurance = (this.selectedPolicyDetails.insuranceName || '').toLowerCase();
        const product = (this.selectedPolicyDetails.productName || '').toLowerCase();

        // Aggressively hide for known non-motor types
        if (type.includes('life') || type.includes('health') ||
            product.includes('life') || product.includes('health') ||
            insurance.includes('lic') || insurance.includes('life') || insurance.includes('health')) {
            return false;
        }

        // Return true if any of these keywords are in the type or product
        const motorKeywords = ['motor', 'auto', 'car', 'vehicle', 'two wheeler', 'gcv', 'pcv', 'commercial'];
        return motorKeywords.some(keyword => type.includes(keyword) || product.includes(keyword));
    }

    get minDate(): string {
        const now = new Date();
        // Format: YYYY-MM-DDTHH:mm
        const year = now.getFullYear();
        const month = String(now.getMonth() + 1).padStart(2, '0');
        const day = String(now.getDate()).padStart(2, '0');
        const hours = String(now.getHours()).padStart(2, '0');
        const minutes = String(now.getMinutes()).padStart(2, '0');
        return `${year}-${month}-${day}T${hours}:${minutes}`;
    }

    get isLateRenewal(): boolean {
        if (!this.selectedPolicy?.expiryDate) return false;

        const type = this.selectedPolicy.type?.toLowerCase() || '';
        if (type === 'life insurance' || type === 'health insurance') return false;

        const oldExpiry = new Date(this.selectedPolicy.expiryDate);
        oldExpiry.setHours(0, 0, 0, 0);

        let newStart = new Date();
        if (this.renewalForm.policyStartDate) {
            newStart = new Date(this.renewalForm.policyStartDate);
        } else if (this.renewalForm.paymentDate) {
            newStart = new Date(this.renewalForm.paymentDate);
        }
        newStart.setHours(0, 0, 0, 0);

        if (newStart <= oldExpiry) return false;

        const msPerDay = 1000 * 60 * 60 * 24;
        const gap = (newStart.getTime() - oldExpiry.getTime()) / msPerDay;

        return gap > 5;
    }

    getPolicyStatus(policy: any): string {
        if (!policy.expiryDate) return policy.status;

        const expiry = new Date(policy.expiryDate);
        const today = new Date();
        today.setHours(0, 0, 0, 0); // Compare dates only

        if (expiry >= today) {
            return 'ACTIVE';
        }
        return 'EXPIRED';
    }

    getOutcomeClass(outcome: string): string {
        switch (outcome) {
            case 'Interested':
            case 'Renewed':
                return 'bg-success';
            case 'Not Interested':
            case 'Late Renewed':
                return 'bg-danger';
            case 'Call Back Later':
                return 'bg-warning text-dark';
            case 'Voicemail':
                return 'bg-info text-dark';
            default:
                return 'bg-secondary';
        }
    }

    openLogCall(policy: any) {
        this.selectedPolicy = policy;
        this.showLogCallModal = true;
        this.callNotes = '';
        this.callOutcome = 'Interested';
        this.nextFollowUp = '';
    }

    closeModal() {
        this.showLogCallModal = false;
        this.selectedPolicy = null;
    }

    submitLogCall() {
        if (!this.selectedPolicy) return;

        if (!this.nextFollowUp) {
            alert('Please select a Next Follow-up date and time.');
            return;
        }

        const currentUser = this.authService.getCurrentUser();
        const agentName = currentUser ? currentUser.username : 'Unknown';

        const payload = {
            notes: this.callNotes,
            outcome: this.callOutcome,
            nextFollowUp: this.nextFollowUp || null,
            agentName: agentName
        };

        this.apiService.logCall(this.selectedPolicy.id, payload).subscribe({
            next: (res: any) => {
                alert('Call logged successfully!');
                this.closeModal();
                // Optionally update the local policy object with new reminder status
                this.selectedPolicy.reminder = res;
                this.dataUpdated.emit(); // Notify parent to refresh
            },
            error: (err: any) => {
                console.error(err);
                alert('Failed to log call.');
            }
        });
    }

    // Call History Methods
    openHistoryModal(policy: any) {
        this.selectedHistoryPolicy = policy;
        this.showHistoryModal = true;
        this.loadingHistory = true;
        this.apiService.getCallHistory(policy.id).subscribe({
            next: (history: any[]) => {
                this.callHistory = history;
                this.loadingHistory = false;
            },
            error: (err: any) => {
                console.error('Error fetching call history:', err);
                this.callHistory = [];
                this.loadingHistory = false;
            }
        });
    }

    closeHistoryModal() {
        this.showHistoryModal = false;
        this.callHistory = [];
        this.selectedHistoryPolicy = null;
    }

    copyEmailTemplate() {
        if (!this.selectedHistoryPolicy) return;

        const p = this.selectedHistoryPolicy;
        const currentUser = this.authService.getCurrentUser();
        const agentName = currentUser ? currentUser.username : 'Unknown';
        const endDate = new Date(p.expiryDate).toLocaleDateString('en-GB');

        const emailText = `Dear ${p.customer.firstName} ${p.customer.lastName},

This is ${agentName} from the Renewal Department, Share India Insurance Brokers Pvt. Ltd.

We have been trying to reach you but were unable to connect. Kindly share a convenient time for us to connect and discuss the renewal of your ${p.type || 'Insurance'} policy to ensure there is no delay or break in coverage.

Policy Details:

Policy No.: ${p.policyNumber}
Insurance Type: ${p.type || 'N/A'}
Product: ${p.productName || 'N/A'}
Renewal Due Date: ${endDate}

Looking forward to your response to assist you with a smooth and timely renewal process.

Warm regards,
${agentName}
Renewal Department
Share India Insurance Brokers Pvt. Ltd.`;

        navigator.clipboard.writeText(emailText).then(() => {
            // Optional: could add an unobtrusive toast notification here, but user asked for no popup.
        }).catch(err => {
            console.error('Failed to copy text: ', err);
        });
    }

    copyRMEmailTemplate() {
        if (!this.selectedHistoryPolicy) return;

        const p = this.selectedHistoryPolicy;
        const endDate = p.expiryDate ? new Date(p.expiryDate).toLocaleDateString('en-GB') : 'N/A';

        const text = `Customer Name : ${p.customer.firstName} ${p.customer.lastName}
Policy No : ${p.policyNumber}
Insurance Type : ${p.type || 'N/A'}
Insurer Name : ${p.insuranceName || 'N/A'}
Product Name : ${p.productName || 'N/A'}
Associate Name : ${p.associateName || p.associateCode || 'N/A'}
Renewal Due Date : ${endDate}`;

        navigator.clipboard.writeText(text).catch(err => {
            console.error('Failed to copy text: ', err);
        });
    }

    openRenewalModal(policy: any) {
        this.selectedPolicy = policy;
        const safePolicy = { ...policy };
        delete safePolicy.reminder; // Prevent circular JSON error
        this.renewalForm = JSON.parse(JSON.stringify(safePolicy)); // Deep copy
        this.renewalForm.policyStartDate = ''; // Clear start date for renewal
        this.showRenewalModal = true;
        this.showLogCallModal = false; // Close log call modal if open
    }

    closeRenewalModal() {
        this.showRenewalModal = false;
        this.renewalForm = { customer: { dob: '' } };
        this.selectedPaymentFile = null;
    }

    submitRenewal() {
        if (!this.selectedPolicy) return;

        // Date validation removed as requested (Dates moved to Servicing)

        if (this.isLateRenewal && !this.renewalForm.lateRenewalReason) {
            alert('Please provide a reason for the late renewal.');
            return;
        }

        // First update details if changed
        const payload = { ...this.renewalForm };
        delete payload.reminder; // Remove reminder to avoid backend deserialization issues

        // Remove date fields to prevent overwriting old dates before renewal calculation
        delete payload.expiryDate;
        delete payload.policyStartDate;
        delete payload.policyEndDate;
        delete payload.lateRenewalReason; // Don't save this on update, pass to renew endpoint

        this.apiService.updatePolicy(this.selectedPolicy.id, payload).subscribe({
            next: () => {
                // Then renew
                const currentUser = this.authService.getCurrentUser();
                const agentName = currentUser ? currentUser.username : 'Unknown';

                // Validate Payment Details
                if (!this.renewalForm.paymentMode) {
                    alert('Please select a Payment Mode');
                    return;
                }
                if (!this.renewalForm.paymentAmount) {
                    alert('Please enter Payment Amount');
                    return;
                }
                if (!this.renewalForm.paymentDate) {
                    alert('Please enter Payment Date');
                    return;
                }
                if (this.renewalForm.paymentMode === 'Cheque' && !this.renewalForm.paymentBank) {
                    alert('Please enter Bank Name for Cheque');
                    return;
                }
                const paymentDetails = {
                    paymentMode: this.renewalForm.paymentMode,
                    paymentReference: this.renewalForm.paymentReference,
                    paymentAmount: this.renewalForm.paymentAmount,
                    paymentDate: this.renewalForm.paymentDate,
                    paymentBank: this.renewalForm.paymentBank,
                    rmName: this.renewalForm.rmName,
                    associateName: this.renewalForm.associateName,
                    associateCode: this.renewalForm.associateCode
                };

                this.apiService.renewPolicy(
                    this.selectedPolicy.id,
                    null, // End Date
                    null, // Start Date
                    agentName,
                    this.renewalForm.lateRenewalReason,
                    paymentDetails,
                    this.selectedPaymentFile // Pass File
                ).subscribe({
                    next: () => {
                        alert(`Policy Renewal Submitted for Issuance!\n\nThe policy is now in 'Pending Issuance' state and will be verified by the Service Team.`);
                        this.closeRenewalModal();
                        this.dataUpdated.emit();
                    },
                    error: (err: any) => alert('Error renewing policy: ' + (err.error?.message || err.message))
                });
            },
            error: (err: any) => alert('Error updating policy details: ' + err.message)
        });
    }

    viewDocument(type: 'payment' | 'policy') {
        if (!this.selectedPolicyDetails) return;
        const id = this.selectedPolicyDetails.id;

        const request = type === 'payment'
            ? this.apiService.downloadPaymentProof(id)
            : this.apiService.downloadPolicyDocument(id);

        request.subscribe({
            next: (blob) => {
                const url = window.URL.createObjectURL(blob);
                window.open(url, '_blank');
                // Note: We can't revoke immediately if we open in new tab, 
                // browser needs time to load it. 
                setTimeout(() => window.URL.revokeObjectURL(url), 10000);
            },
            error: () => alert('Failed to view document. It might not exist.')
        });
    }

    onDeletePolicy(policy: any) {
        if (confirm(`Are you sure you want to delete policy ${policy.policyNumber}? This action cannot be undone.`)) {
            this.apiService.deletePolicy(policy.id).subscribe({
                next: () => {
                    alert('Policy deleted successfully.');
                    this.dataUpdated.emit();
                },
                error: (err) => {
                    console.error('Error deleting policy:', err);
                    alert('Failed to delete policy.');
                }
            });
        }
    }

    // Edit Mode Logic (Mirrored from MIS/Admin Dashboard)
    isEditing: boolean = false;

    toggleEditMode(): void {
        if (this.isEditing) {
            this.isEditing = false;
        } else {
            this.isEditing = true;
        }
    }

    savePolicyChanges(): void {
        if (!this.selectedPolicyDetails) return;

        this.apiService.updatePolicy(this.selectedPolicyDetails.id, this.selectedPolicyDetails).subscribe({
            next: (updatedPolicy) => {
                alert('Policy details updated successfully!');
                this.selectedPolicyDetails = updatedPolicy; // Update view
                this.isEditing = false;
                this.dataUpdated.emit(); // Refresh parent lists
            },
            error: (err) => {
                console.error('Error updating policy:', err);
                alert('Failed to update policy details.');
            }
        });
    }
}
