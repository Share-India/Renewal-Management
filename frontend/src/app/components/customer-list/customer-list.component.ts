import { forkJoin } from 'rxjs';
import { Component, Input, Output, EventEmitter, OnChanges, SimpleChanges, HostListener } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { ApiService } from '../../services/api.service';
import { AuthService } from '../../services/auth.service';
import { NotificationService } from '../../services/notification.service';

@Component({
    selector: 'app-customer-list',
    standalone: true,
    imports: [CommonModule, FormsModule],
    templateUrl: './customer-list.component.html',
    styleUrls: ['./customer-list.component.css']
})
export class CustomerListComponent implements OnChanges {
    @Input() policies: any[] = [];
    @Input() loading: boolean = false;
    @Input() isAdmin: boolean = false;
    @Input() adminViewAs: string = '';
    @Output() dataUpdated = new EventEmitter<void>();

    currentPage: number = 1;
    pageSize: number = 50;
    pageSizeOptions: number[] = [25, 50, 100, 200];

    get totalPages(): number {
        if (!this.policies || this.policies.length === 0) return 1;
        return Math.ceil(this.policies.length / this.pageSize);
    }

    get pagedPolicies(): any[] {
        if (!this.policies || this.policies.length === 0) return [];
        if (this.policies.length <= this.pageSize) {
            return this.policies;
        }
        const startIndex = (this.currentPage - 1) * this.pageSize;
        return this.policies.slice(startIndex, startIndex + this.pageSize);
    }

    get startIndex(): number {
        if (!this.policies || this.policies.length === 0) return 0;
        return (this.currentPage - 1) * this.pageSize + 1;
    }

    get endIndex(): number {
        if (!this.policies || this.policies.length === 0) return 0;
        return Math.min(this.currentPage * this.pageSize, this.policies.length);
    }

    goToPage(page: number) {
        if (page < 1) page = 1;
        if (page > this.totalPages) page = this.totalPages;
        this.currentPage = page;
    }

    onPageSizeChange() {
        this.currentPage = 1;
    }

    trackByPolicyNumber(index: number, policy: any): any {
        return policy?.policyNumber || policy?.id || index;
    }

    ngOnChanges(changes: SimpleChanges) {
        if (changes['policies']) {
            this.currentPage = 1;
            if (this.selectedPolicyIds.size > 0 && this.policies) {
                const currentIds = new Set(this.policies.map(p => p.id));
                const toRemove: number[] = [];
                this.selectedPolicyIds.forEach(id => {
                    if (!currentIds.has(id)) toRemove.push(id);
                });
                toRemove.forEach(id => this.selectedPolicyIds.delete(id));
            } else if (!this.policies || this.policies.length === 0) {
                this.selectedPolicyIds.clear();
            }
        }
    }

    // Bulk & Excel Keyboard/Mouse Selection State
    selectedPolicyIds: Set<number> = new Set<number>();
    focusedRowIndex: number = -1;
    selectionAnchorIndex: number = -1;
    selectedBeforeShift: Set<number> = new Set<number>();
    isMouseDown: boolean = false;
    showBulkAssignModal: boolean = false;
    bulkAssigning: boolean = false;

    get canAssign(): boolean {
        return this.isClaimsManager || this.isSalesManager || this.isUnderwritingManager;
    }

    isPolicySelected(policy: any): boolean {
        return policy && policy.id ? this.selectedPolicyIds.has(policy.id) : false;
    }

    isRowFocused(index: number): boolean {
        return this.focusedRowIndex === index;
    }

    onRowClick(event: MouseEvent, policy: any, index: number) {
        if (!this.canAssign || !policy || !policy.id) return;
        const target = event.target as HTMLElement;
        if (target.closest('button') || target.closest('a') || target.closest('select') || target.closest('input')) {
            return;
        }

        this.focusedRowIndex = index;

        if (event.shiftKey) {
            this.applyShiftSelection(index);
        } else if (event.ctrlKey || event.metaKey) {
            this.togglePolicySelection(policy, index);
            this.selectionAnchorIndex = index;
            this.selectedBeforeShift = new Set(this.selectedPolicyIds);
        } else {
            this.selectionAnchorIndex = index;
            this.selectedBeforeShift = new Set(this.selectedPolicyIds);
        }
    }

    onRowMouseDown(event: MouseEvent, policy: any, index: number) {
        if (!this.canAssign || !policy || !policy.id) return;
        const target = event.target as HTMLElement;
        if (target.closest('button') || target.closest('a') || target.closest('select')) {
            return;
        }

        this.isMouseDown = true;
        this.focusedRowIndex = index;

        if (event.shiftKey) {
            this.applyShiftSelection(index);
        } else if (!event.ctrlKey && !event.metaKey && !target.closest('input[type="checkbox"]')) {
            this.selectionAnchorIndex = index;
            this.selectedBeforeShift = new Set(this.selectedPolicyIds);
        }
    }

    onRowMouseEnter(index: number) {
        if (!this.canAssign || !this.isMouseDown || this.selectionAnchorIndex === -1) return;

        window.getSelection()?.removeAllRanges();
        this.focusedRowIndex = index;

        this.selectedPolicyIds = new Set(this.selectedBeforeShift);
        const start = Math.min(this.selectionAnchorIndex, index);
        const end = Math.max(this.selectionAnchorIndex, index);

        for (let i = start; i <= end; i++) {
            const p = this.pagedPolicies[i];
            if (p && p.id) {
                this.selectedPolicyIds.add(p.id);
            }
        }
    }

    @HostListener('window:mouseup')
    onWindowMouseUp() {
        this.isMouseDown = false;
    }

    onCheckboxClick(event: MouseEvent, policy: any, index: number) {
        event.stopPropagation();
        if (!policy || !policy.id) return;

        this.focusedRowIndex = index;

        if (event.shiftKey) {
            this.applyShiftSelection(index);
        } else {
            this.togglePolicySelection(policy, index);
            this.selectionAnchorIndex = index;
            this.selectedBeforeShift = new Set(this.selectedPolicyIds);
        }
    }

    onCheckboxCellClick(event: MouseEvent, policy: any, index: number) {
        if ((event.target as HTMLElement).tagName.toLowerCase() === 'input') {
            return;
        }
        this.onCheckboxClick(event, policy, index);
    }

    togglePolicySelection(policy: any, index: number) {
        if (!policy || !policy.id) return;
        if (this.selectedPolicyIds.has(policy.id)) {
            this.selectedPolicyIds.delete(policy.id);
        } else {
            this.selectedPolicyIds.add(policy.id);
        }
    }

    applyShiftSelection(index: number) {
        window.getSelection()?.removeAllRanges();

        if (this.selectionAnchorIndex === -1) {
            this.selectionAnchorIndex = index;
            this.selectedBeforeShift = new Set(this.selectedPolicyIds);
        }

        this.focusedRowIndex = index;

        this.selectedPolicyIds = new Set(this.selectedBeforeShift);
        const start = Math.min(this.selectionAnchorIndex, index);
        const end = Math.max(this.selectionAnchorIndex, index);

        for (let i = start; i <= end; i++) {
            const p = this.pagedPolicies[i];
            if (p && p.id) {
                this.selectedPolicyIds.add(p.id);
            }
        }
    }

    @HostListener('window:keydown', ['$event'])
    handleKeyboardEvent(event: KeyboardEvent) {
        if (!this.canAssign || !this.pagedPolicies || this.pagedPolicies.length === 0) return;

        // Do not intercept if user is typing in form controls or modals
        if (this.showBulkAssignModal || this.showAssignModal || this.showLogCallModal || 
            this.showDetailsModal || this.showRouteModal || this.showClaimsUploadModal || 
            this.showUnderwritingModal || this.showSalesModal || this.showCaseDecisionModal || 
            this.showRmUpdateModal || this.showRenewerUploadModal) {
            return;
        }

        const activeEl = document.activeElement;
        if (activeEl && (activeEl.tagName === 'INPUT' || activeEl.tagName === 'TEXTAREA' || activeEl.tagName === 'SELECT')) {
            return;
        }

        if (event.key === 'ArrowDown') {
            event.preventDefault();
            this.handleArrowKey(1, event.shiftKey);
        } else if (event.key === 'ArrowUp') {
            event.preventDefault();
            this.handleArrowKey(-1, event.shiftKey);
        } else if (event.key === ' ' || event.code === 'Space') {
            event.preventDefault();
            if (this.focusedRowIndex >= 0 && this.focusedRowIndex < this.pagedPolicies.length) {
                const policy = this.pagedPolicies[this.focusedRowIndex];
                this.togglePolicySelection(policy, this.focusedRowIndex);
                this.selectionAnchorIndex = this.focusedRowIndex;
                this.selectedBeforeShift = new Set(this.selectedPolicyIds);
            }
        } else if ((event.ctrlKey || event.metaKey) && (event.key === 'a' || event.key === 'A')) {
            event.preventDefault();
            this.pagedPolicies.forEach(p => {
                if (p && p.id) this.selectedPolicyIds.add(p.id);
            });
            this.selectedBeforeShift = new Set(this.selectedPolicyIds);
        } else if (event.key === 'Escape') {
            if (this.selectedPolicyIds.size > 0) {
                this.clearSelection();
            }
        }
    }

    handleArrowKey(delta: number, isShift: boolean) {
        if (this.pagedPolicies.length === 0) return;

        if (this.focusedRowIndex === -1) {
            this.focusedRowIndex = delta > 0 ? 0 : this.pagedPolicies.length - 1;
            this.selectionAnchorIndex = this.focusedRowIndex;
            this.selectedBeforeShift = new Set(this.selectedPolicyIds);

            if (isShift) {
                const currentPolicy = this.pagedPolicies[this.focusedRowIndex];
                if (currentPolicy && currentPolicy.id) {
                    this.selectedPolicyIds.add(currentPolicy.id);
                }
            }
            this.scrollToFocusedRow();
            return;
        }

        const nextIndex = this.focusedRowIndex + delta;
        if (nextIndex < 0 || nextIndex >= this.pagedPolicies.length) {
            return;
        }

        if (isShift) {
            if (this.selectionAnchorIndex === -1) {
                this.selectionAnchorIndex = this.focusedRowIndex;
                this.selectedBeforeShift = new Set(this.selectedPolicyIds);
                const anchorPolicy = this.pagedPolicies[this.selectionAnchorIndex];
                if (anchorPolicy && anchorPolicy.id) {
                    this.selectedPolicyIds.add(anchorPolicy.id);
                }
            }

            this.focusedRowIndex = nextIndex;

            this.selectedPolicyIds = new Set(this.selectedBeforeShift);
            const start = Math.min(this.selectionAnchorIndex, this.focusedRowIndex);
            const end = Math.max(this.selectionAnchorIndex, this.focusedRowIndex);

            for (let i = start; i <= end; i++) {
                const p = this.pagedPolicies[i];
                if (p && p.id) {
                    this.selectedPolicyIds.add(p.id);
                }
            }
        } else {
            this.focusedRowIndex = nextIndex;
            this.selectionAnchorIndex = nextIndex;
            this.selectedBeforeShift = new Set(this.selectedPolicyIds);
        }

        this.scrollToFocusedRow();
    }

    scrollToFocusedRow() {
        setTimeout(() => {
            const el = document.getElementById('policy-row-' + this.focusedRowIndex);
            if (el) {
                el.scrollIntoView({ block: 'nearest', behavior: 'smooth' });
            }
        }, 10);
    }

    isAllPageSelected(): boolean {
        if (!this.pagedPolicies || this.pagedPolicies.length === 0) return false;
        return this.pagedPolicies.every(p => this.selectedPolicyIds.has(p.id));
    }

    isPartiallySelected(): boolean {
        if (!this.pagedPolicies || this.pagedPolicies.length === 0) return false;
        const count = this.pagedPolicies.filter(p => this.selectedPolicyIds.has(p.id)).length;
        return count > 0 && count < this.pagedPolicies.length;
    }

    toggleSelectAllPage(event: any) {
        const checked = event.target.checked;
        if (checked) {
            this.pagedPolicies.forEach(p => {
                if (p && p.id) this.selectedPolicyIds.add(p.id);
            });
        } else {
            this.pagedPolicies.forEach(p => {
                if (p && p.id) this.selectedPolicyIds.delete(p.id);
            });
        }
        this.selectedBeforeShift = new Set(this.selectedPolicyIds);
    }

    selectAllPolicies() {
        if (!this.policies) return;
        this.policies.forEach(p => {
            if (p && p.id) this.selectedPolicyIds.add(p.id);
        });
        this.selectedBeforeShift = new Set(this.selectedPolicyIds);
    }

    clearSelection() {
        this.selectedPolicyIds.clear();
        this.focusedRowIndex = -1;
        this.selectionAnchorIndex = -1;
        this.selectedBeforeShift.clear();
    }

    openBulkAssignModal() {
        if (this.selectedPolicyIds.size === 0) return;
        this.showBulkAssignModal = true;
        this.selectedAssignUser = '';
        this.loadAvailableUsersForTeam();
    }

    closeBulkAssignModal() {
        this.showBulkAssignModal = false;
        this.selectedAssignUser = '';
        this.bulkAssigning = false;
    }

    loadAvailableUsersForTeam() {
        let roleToFetch = '';
        if (this.isClaimsManager) roleToFetch = 'CLAIMS';
        else if (this.isSalesManager) roleToFetch = 'SALES';
        else if (this.isUnderwritingManager) roleToFetch = 'UNDERWRITING';

        this.apiService.getUsers().subscribe({
            next: (users) => {
                this.availableUsersForTeam = users.filter((u: any) => {
                    const role = (u.role || '').toUpperCase();
                    return role.includes(roleToFetch) && !role.includes('MANAGER');
                });
            },
            error: (err) => console.error('Error fetching team users:', err)
        });
    }

    submitBulkAssign() {
        if (!this.selectedAssignUser || this.selectedPolicyIds.size === 0) return;

        let team = '';
        if (this.isClaimsManager) team = 'CLAIMS';
        else if (this.isSalesManager) team = 'SALES';
        else if (this.isUnderwritingManager) team = 'UNDERWRITING';

        this.bulkAssigning = true;
        const policyIds = Array.from(this.selectedPolicyIds);

        this.apiService.bulkRoutePolicies(policyIds, team, this.selectedAssignUser).subscribe({
            next: (res: any) => {
                this.bulkAssigning = false;
                const count = res.count || policyIds.length;
                const isUnassign = this.selectedAssignUser === '__UNASSIGN__';
                const assignedName = isUnassign ? 'Unassigned' : this.selectedAssignUser;
                this.notificationService.showSuccessToast(
                    `${count} policies ${isUnassign ? 'unassigned' : 'assigned to ' + assignedName} successfully.`
                );
                this.closeBulkAssignModal();
                this.clearSelection();
                this.dataUpdated.emit();
            },
            error: (err: any) => {
                if (err.status === 404) {
                    // Fallback to parallel single routes if backend hasn't reloaded the bulk endpoint yet
                    const userToAssign = this.selectedAssignUser === '__UNASSIGN__' ? null : this.selectedAssignUser;
                    const requests = policyIds.map(id => this.apiService.routePolicy(id, team, userToAssign));
                    forkJoin(requests).subscribe({
                        next: () => {
                            this.bulkAssigning = false;
                            const isUnassign = this.selectedAssignUser === '__UNASSIGN__';
                            const assignedName = isUnassign ? 'Unassigned' : this.selectedAssignUser;
                            this.notificationService.showSuccessToast(
                                `${policyIds.length} policies ${isUnassign ? 'unassigned' : 'assigned to ' + assignedName} successfully.`
                            );
                            this.closeBulkAssignModal();
                            this.clearSelection();
                            this.dataUpdated.emit();
                        },
                        error: (fallbackErr: any) => {
                            this.bulkAssigning = false;
                            console.error('Error assigning policies in fallback:', fallbackErr);
                            this.notificationService.showErrorModal('Error assigning policies.');
                        }
                    });
                    return;
                }
                this.bulkAssigning = false;
                console.error('Error bulk assigning policies:', err);
                const msg = err.error?.message || err.message || 'Error bulk assigning policies';
                this.notificationService.showErrorModal(msg);
            }
        });
    }

    selectedPolicy: any = null;
    selectedPolicyDetails: any = null;
    showLogCallModal: boolean = false;
    showDetailsModal: boolean = false;
    sendingEmail: boolean = false;
    sendingRmEmail: boolean = false;
    
    // Routing & Workflow Logic
    showRouteModal: boolean = false;
    selectedRouteTeam: string = '';
    
    showAssignModal: boolean = false;
    selectedAssignUser: string = '';
    availableUsersForTeam: any[] = [];
    
    showClaimsUploadModal: boolean = false;
    claimsExcelFile: File | null = null;
    claimsPdfFile: File | null = null;
    claimsNote: string = '';
    
    showUnderwritingModal: boolean = false;
    underwritingDocFile: File | null = null;
    underwritingNote: string = '';

    showSalesModal: boolean = false;
    salesNote: string = '';

    // Case Work Decision Logic (Will Work / Will Not Work)
    showCaseDecisionModal: boolean = false;
    selectedPolicyForCaseDecision: any = null;
    selectedDecisionOption: 'WILL_WORK' | 'WILL_NOT_WORK' | '' = '';
    caseDecisionNoteText: string = '';
    loadingCaseDecision: boolean = false;

    // RM Update Logic
    showRmUpdateModal: boolean = false;
    rmUpdateText: string = '';
    selectedPolicyForRmUpdate: any = null;

    // Form fields
    callNotes: string = '';
    contactTo: string = '';
    contactName: string = '';
    contactNumber: string = '';
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

    constructor(private apiService: ApiService, private authService: AuthService, private notificationService: NotificationService) { }

    openDetailsModal(policy: any) {
        // Show modal immediately with cached data for responsiveness
        this.selectedPolicyDetails = policy;
        if (this.selectedPolicyDetails && !this.selectedPolicyDetails.customer) {
            this.selectedPolicyDetails.customer = {};
        }
        this.showDetailsModal = true;
        this.isEditing = false;

        // Fetch latest version from server to ensure fresh data
        if (policy && policy.id) {
            this.apiService.getPolicyById(policy.id).subscribe({
                next: (freshPolicy) => {
                    this.selectedPolicyDetails = freshPolicy;
                    if (this.selectedPolicyDetails && !this.selectedPolicyDetails.customer) {
                        this.selectedPolicyDetails.customer = {};
                    }
                    console.log('Policy details refreshed from server');
                },
                error: (err) => console.error('Error refreshing policy details:', err)
            });
        }
    }

    closeDetailsModal() {
        this.showDetailsModal = false;
        this.selectedPolicyDetails = null;
    }

    get canEditPolicy(): boolean {
        // Sales and Claims team views should not have edit access in the Eye modal.
        if (this.adminViewAs === 'sales' || this.adminViewAs === 'claims') {
            return false;
        }
        return this.authService.hasRole('ADMIN') || this.authService.hasRole('MIS') || this.isUnderwritingManager || this.isUnderwritingUser;
    }

    // Role Checks for Routing
    get isRenewer(): boolean { return this.authService.hasRole('RENEWER'); }
    get isClaimsManager(): boolean { const as = (this.adminViewAs || this.apiService.adminViewAs || '').toLowerCase(); return as === 'claims' || this.authService.hasRole('CLAIMS_MANAGER'); }
    get isSalesManager(): boolean { const as = (this.adminViewAs || this.apiService.adminViewAs || '').toLowerCase(); return as === 'sales' || this.authService.hasRole('SALES_MANAGER'); }
    get isSalesUser(): boolean { return this.authService.hasRole('SALES'); }
    get isUnderwritingManager(): boolean { const as = (this.adminViewAs || this.apiService.adminViewAs || '').toLowerCase(); return as === 'underwriting' || this.authService.hasRole('UNDERWRITING_MANAGER'); }
    get isUnderwritingUser(): boolean { return this.authService.hasRole('UNDERWRITING'); }
    get isClaimsUser(): boolean { return this.authService.hasRole('CLAIMS'); }
    get isTeamRole(): boolean { return this.isClaimsManager || this.isClaimsUser || this.isSalesManager || this.isSalesUser || this.isUnderwritingManager || this.isUnderwritingUser; }

    get canSetHotSale(): boolean {
        if (this.adminViewAs === 'sales') return true;
        if (this.authService.isAdmin() && !this.adminViewAs) {
            return false;
        }
        return this.authService.hasRole('RM') || this.authService.hasRole('SALES') || this.authService.hasRole('SALES_MANAGER');
    }

    get currentHotSaleSource(): string {
        if (this.adminViewAs === 'sales' || this.authService.hasRole('SALES') || this.authService.hasRole('SALES_MANAGER')) {
            return 'SALES';
        }
        return 'RM';
    }

    isPolicyHotSale(policy: any): boolean {
        if (!policy || !policy.isHotSale) return false;

        // If marked from RM Dashboard
        if (policy.hotSaleSource === 'RM') {
            // Visible at: Admin, Renewer, Policy Servicing, MIS, Sales/RM dashboard
            if (this.isAdmin) return true;
            if (this.isRenewer) return true;
            if (this.isRm) return true;
            if (this.isSalesManager || this.isSalesUser) return true;
            if (this.authService.hasRole('SERVICING') || this.authService.hasRole('MIS')) return true;
            return false;
        }

        // If marked from Sales Work
        if (policy.hotSaleSource === 'SALES') {
            // Visible at: Claims Team, Underwriting team, Sales/RM dashboard (and Admin), and Renewer
            if (this.isAdmin) return true;
            if (this.isRenewer) return true;
            if (this.isClaimsManager || this.isClaimsUser) return true;
            if (this.isUnderwritingManager || this.isUnderwritingUser) return true;
            if (this.isRm || this.isSalesManager || this.isSalesUser) return true;
            return false;
        }

        return !!policy.isHotSale;
    }

    toggleHotSale(policy: any) {
        if (!this.canSetHotSale) return;
        const newStatus = !policy.isHotSale;
        const source = newStatus ? this.currentHotSaleSource : null;

        this.apiService.toggleHotSale(policy.id, { isHotSale: newStatus, source: source }).subscribe({
            next: (res: any) => {
                policy.isHotSale = newStatus;
                policy.hotSaleSource = source;
                if (newStatus) {
                    this.notificationService.showSuccessToast(`Marked as Hot Sale (${source})`);
                } else {
                    this.notificationService.showSuccessToast('Hot Sale status removed');
                }
                this.dataUpdated.emit();
            },
            error: (err: any) => {
                console.error('Error toggling hot sale:', err);
                this.notificationService.showErrorModal('Error updating Hot Sale status');
            }
        });
    }

    get canSetCaseDecision(): boolean {
        if (this.adminViewAs === 'sales') return true;
        if (this.authService.isAdmin() && !this.adminViewAs) {
            return false;
        }
        return this.authService.hasRole('RM') || this.authService.hasRole('SALES') || this.authService.hasRole('SALES_MANAGER');
    }

    canSendBackToRenewer(policy: any): boolean {
        return this.isTeamRole;
    }

    get currentDecisionSource(): string {
        if (this.adminViewAs === 'sales' || this.authService.hasRole('SALES') || this.authService.hasRole('SALES_MANAGER')) {
            return 'SALES';
        }
        return 'RM';
    }

    shouldShowCaseDecision(policy: any): boolean {
        if (!policy || !policy.caseWorkDecision) return false;

        // If marked from RM Dashboard
        if (policy.caseDecisionSource === 'RM') {
            // Seen by: Renewer, Admin, RM, Sales
            if (this.isAdmin || this.authService.isAdmin()) return true;
            if (this.isRenewer) return true;
            if (this.isRm) return true;
            if (this.isSalesManager || this.isSalesUser) return true;
            return false;
        }

        // If marked from Sales Work
        if (policy.caseDecisionSource === 'SALES') {
            // Seen by all teams: Claims Team, Underwriting team, Sales team, Renewer, Admin, Servicing, MIS
            if (this.isAdmin || this.authService.isAdmin()) return true;
            if (this.isRenewer) return true;
            if (this.isClaimsManager || this.isClaimsUser) return true;
            if (this.isUnderwritingManager || this.isUnderwritingUser) return true;
            if (this.isSalesManager || this.isSalesUser) return true;
            if (this.isRm) return true;
            if (this.authService.hasRole('SERVICING') || this.authService.hasRole('MIS')) return true;
            return false;
        }

        return true;
    }

    openCaseDecisionModal(policy: any) {
        this.selectedPolicyForCaseDecision = policy;
        this.selectedDecisionOption = (policy.caseWorkDecision as 'WILL_WORK' | 'WILL_NOT_WORK') || '';
        this.caseDecisionNoteText = policy.caseDecisionNote || '';
        this.showCaseDecisionModal = true;
    }

    closeCaseDecisionModal() {
        this.showCaseDecisionModal = false;
        this.selectedPolicyForCaseDecision = null;
        this.selectedDecisionOption = '';
        this.caseDecisionNoteText = '';
        this.loadingCaseDecision = false;
    }

    submitCaseDecision(decision?: 'WILL_WORK' | 'WILL_NOT_WORK' | 'RESET') {
        if (!this.selectedPolicyForCaseDecision) return;
        const dec = decision !== undefined ? decision : this.selectedDecisionOption;
        if (!dec) {
            this.notificationService.showErrorModal('Please select whether to work or not work on this case.');
            return;
        }

        this.loadingCaseDecision = true;
        const source = this.currentDecisionSource;
        const payload = {
            decision: dec === 'RESET' ? null : dec,
            source: source,
            note: this.caseDecisionNoteText ? this.caseDecisionNoteText.trim() : null
        };

        this.apiService.saveCaseDecision(this.selectedPolicyForCaseDecision.id, payload).subscribe({
            next: (updatedPolicy: any) => {
                this.selectedPolicyForCaseDecision.caseWorkDecision = payload.decision;
                this.selectedPolicyForCaseDecision.caseDecisionSource = payload.decision ? source : null;
                this.selectedPolicyForCaseDecision.caseDecisionBy = payload.decision ? (updatedPolicy.caseDecisionBy || this.authService.getCurrentUser()?.username) : null;
                this.selectedPolicyForCaseDecision.caseDecisionAt = payload.decision ? updatedPolicy.caseDecisionAt : null;
                this.selectedPolicyForCaseDecision.caseDecisionNote = payload.decision ? payload.note : null;

                const msg = payload.decision === 'WILL_WORK' 
                    ? 'Policy marked as "Will Work on Case"!' 
                    : payload.decision === 'WILL_NOT_WORK'
                        ? 'Policy marked as "Will Not Work on Case"!'
                        : 'Case work decision cleared.';
                this.notificationService.showSuccessToast(msg);
                this.closeCaseDecisionModal();
                this.dataUpdated.emit();
            },
            error: (err: any) => {
                console.error('Error saving case decision:', err);
                this.notificationService.showErrorModal('Failed to save case decision: ' + (err.error?.message || err.message));
                this.loadingCaseDecision = false;
            }
        });
    }

    getCaseDecisionTooltip(policy: any): string {
        if (!policy || !policy.caseWorkDecision) return '';
        const by = policy.caseDecisionBy ? ` by ${policy.caseDecisionBy}` : '';
        const source = policy.caseDecisionSource ? ` (${policy.caseDecisionSource})` : '';
        const note = policy.caseDecisionNote ? `\nNote: ${policy.caseDecisionNote}` : '';
        const dec = policy.caseWorkDecision === 'WILL_WORK' ? 'Will Work on Case' : 'Will Not Work on Case';
        return `${dec}${by}${source}${note}`;
    }

    openCaseDecisionDetails(policy: any) {
        if (!policy || !policy.caseWorkDecision) return;
        const dec = policy.caseWorkDecision === 'WILL_WORK' ? 'Will Work on Case' : 'Will Not Work on Case';
        const by = policy.caseDecisionBy || 'RM/Sales';
        const source = policy.caseDecisionSource || '';
        const note = policy.caseDecisionNote ? `<br><br><strong>Note:</strong> ${policy.caseDecisionNote}` : '';

        this.notificationService.showInfoModal(
            `Case Work Decision`,
            `<strong>Status:</strong> ${dec}<br><strong>Decided By:</strong> ${by} (${source})${note}`
        );
    }

    canDeleteDocument(doc: any, team: string): boolean {
        const currentUser = this.authService.getCurrentUser()?.username;
        if (team === 'CLAIMS' && this.isClaimsManager) return true;
        if (team === 'UNDERWRITING' && this.isUnderwritingManager) return true;
        return doc.uploadedByUsername === currentUser;
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

        // If explicit motor fields are present, it's motor
        if (this.selectedPolicyDetails.vehicleRegNo || this.selectedPolicyDetails.vehicleModel ||
            this.selectedPolicyDetails.vehicleType || this.selectedPolicyDetails.mfgYear ||
            this.selectedPolicyDetails.idv || this.selectedPolicyDetails.odAmount || this.selectedPolicyDetails.tpAmount) {
            return true;
        }

        // Aggressively hide for known non-motor types
        if (type.includes('life') || type.includes('health') ||
            product.includes('life') || product.includes('health') ||
            insurance.includes('lic') || insurance.includes('life') || insurance.includes('health')) {
            return false;
        }

        // Return true if any motor keywords are in the type or product
        const motorKeywords = ['motor', 'auto', 'car', 'vehicle', 'two wheeler', 'gcv', 'pcv'];
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

    getTeamDisplayName(team: string): string {
        if (!team) return '';
        const upper = team.toUpperCase();
        if (upper === 'CLAIMS') return 'Claims Team';
        if (upper === 'SALES') return 'Sales Team';
        if (upper === 'UNDERWRITING') return 'Underwriting Team';
        if (upper === 'RENEWER') return 'Renewer';
        return team + ' Team';
    }

    hasTeamUpdate(policy: any): boolean {
        if (!policy) return false;
        if (policy.claimsNote && policy.claimsNote.trim()) return true;
        if (policy.salesNote && policy.salesNote.trim()) return true;
        if (policy.underwritingNote && policy.underwritingNote.trim()) return true;
        if (policy.claimsExcelPath || policy.claimsPdfPath || policy.underwritingDocPath) return true;
        if (policy.teamDocuments && policy.teamDocuments.length > 0) {
            return policy.teamDocuments.some((d: any) => d.uploadedByTeam && d.uploadedByTeam !== 'RENEWER');
        }
        return false;
    }

    getTeamUpdateDisplayName(policy: any): string {
        if (!policy) return 'Team Update';
        if (policy.targetTeam === 'CLAIMS' || policy.lastRoutedFrom === 'CLAIMS') {
            return 'Claims Update';
        }
        if (policy.targetTeam === 'SALES' || policy.lastRoutedFrom === 'SALES') {
            return 'Sales Update';
        }
        if (policy.targetTeam === 'UNDERWRITING' || policy.lastRoutedFrom === 'UNDERWRITING') {
            return 'Underwriting Update';
        }
        if (policy.claimsNote || policy.claimsExcelPath || policy.claimsPdfPath) return 'Claims Update';
        if (policy.salesNote) return 'Sales Update';
        if (policy.underwritingNote || policy.underwritingDocPath) return 'Underwriting Update';
        return 'Team Update';
    }

    getTeamUpdateTooltip(policy: any): string {
        if (!policy) return '';
        const parts: string[] = [];
        if (policy.claimsNote) parts.push(`Claims: ${policy.claimsNote}`);
        if (policy.salesNote) parts.push(`Sales: ${policy.salesNote}`);
        if (policy.underwritingNote) parts.push(`Underwriting: ${policy.underwritingNote}`);
        if (policy.claimsExcelPath || policy.claimsPdfPath) parts.push('Claims documents attached');
        if (policy.underwritingDocPath) parts.push('Underwriting documents attached');
        return parts.length > 0 ? parts.join(' | ') : 'Click to view update details';
    }

    sendEmail() {
        if (!this.selectedPolicy) return;

        this.sendingEmail = true;
        this.apiService.sendCustomerEmail(this.selectedPolicy.id).subscribe({
            next: (response) => {
                this.notificationService.showSuccessToast('Email sent successfully!');
                this.sendingEmail = false;
            },
            error: (err) => {
                console.error('Error sending email', err);
                this.notificationService.showErrorModal('Failed to send email. Ensure the customer has a valid email address.');
                this.sendingEmail = false;
            }
        });
    }

    sendRmEmail() {
        if (!this.selectedPolicy) return;

        this.sendingRmEmail = true;
        this.apiService.sendRmEmail(this.selectedPolicy.id).subscribe({
            next: (response) => {
                this.notificationService.showSuccessToast('RM Email sent successfully!');
                this.sendingRmEmail = false;
            },
            error: (err) => {
                console.error('Error sending RM email', err);
                this.notificationService.showErrorModal(err.error?.message || 'Failed to send RM email. Ensure the policy has a valid RM email address.');
                this.sendingRmEmail = false;
            }
        });
    }

    get isPosp(): boolean {
        return this.authService.hasRole('POSP');
    }

    get isRm(): boolean {
        return this.authService.hasRole('RM');
    }

    openRmUpdateModal(policy: any) {
        this.selectedPolicyForRmUpdate = policy;
        this.rmUpdateText = policy.rmUpdate || '';
        this.showRmUpdateModal = true;
    }

    closeRmUpdateModal() {
        this.showRmUpdateModal = false;
        this.selectedPolicyForRmUpdate = null;
        this.rmUpdateText = '';
    }

    submitRmUpdate() {
        if (!this.selectedPolicyForRmUpdate) return;
        this.apiService.saveRmUpdate(this.selectedPolicyForRmUpdate.id, this.rmUpdateText).subscribe({
            next: (updatedPolicy) => {
                // Update local list
                const index = this.policies.findIndex(p => p.id === updatedPolicy.id);
                if (index !== -1) {
                    this.policies[index].rmUpdate = updatedPolicy.rmUpdate;
                }
                if (this.selectedPolicy && this.selectedPolicy.id === updatedPolicy.id) {
                    this.selectedPolicy.rmUpdate = updatedPolicy.rmUpdate;
                }
                this.notificationService.showSuccessToast('RM Update saved successfully!');
                this.closeRmUpdateModal();
            },
            error: (err) => {
                console.error('Error saving RM update', err);
                this.notificationService.showErrorModal('Failed to save RM update.');
            }
        });
    }

    openLogCall(policy: any) {
        this.selectedPolicy = policy;
        this.showLogCallModal = true;
        this.callNotes = '';
        this.callOutcome = 'Interested';
        this.nextFollowUp = '';
        this.contactTo = '';
        this.contactName = '';
        this.contactNumber = '';
    }

    setContactTo(role: string) {
        this.contactTo = role;
        this.contactName = '';
        this.contactNumber = '';
        
        if (!this.selectedPolicy) return;

        if (role === 'Client' && this.selectedPolicy.customer) {
            this.contactName = `${this.selectedPolicy.customer.firstName || ''} ${this.selectedPolicy.customer.lastName || ''}`.trim();
            this.contactNumber = this.selectedPolicy.customer.phone || '';
        } else if (role === 'RM') {
            this.contactName = this.selectedPolicy.rmName || '';
        } else if (role === 'Associate') {
            this.contactName = this.selectedPolicy.associateName || '';
        }
    }

    closeModal() {
        this.showLogCallModal = false;
        this.selectedPolicy = null;
    }

    validateNumber(event: any) {
        const input = event.target.value;
        this.contactNumber = input.replace(/[^0-9]/g, '');
        event.target.value = this.contactNumber;
    }

    submitLogCall() {
        if (!this.selectedPolicy) return;

        if (!this.nextFollowUp) {
            this.notificationService.showErrorModal('Please select a Next Follow-up date and time.');
            return;
        }

        const currentUser = this.authService.getCurrentUser();
        const agentName = currentUser ? currentUser.username : 'Unknown';

        const payload = {
            notes: this.callNotes,
            outcome: this.callOutcome,
            nextFollowUp: this.nextFollowUp || null,
            agentName: agentName,
            contactTo: this.contactTo,
            contactName: this.contactName,
            contactNumber: this.contactNumber
        };

        this.apiService.logCall(this.selectedPolicy.id, payload).subscribe({
            next: (res: any) => {
                this.notificationService.showSuccessToast('Call logged successfully!');
                this.closeModal();
                // Optionally update the local policy object with new reminder status
                this.selectedPolicy.reminder = res;
                this.dataUpdated.emit(); // Notify parent to refresh
            },
            error: (err: any) => {
                console.error(err);
                this.notificationService.showErrorModal('Failed to log call.');
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
            this.notificationService.showErrorModal('Please provide a reason for the late renewal.');
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
                    this.notificationService.showErrorModal('Please select a Payment Mode');
                    return;
                }
                if (!this.renewalForm.paymentAmount) {
                    this.notificationService.showErrorModal('Please enter Payment Amount');
                    return;
                }
                if (!this.renewalForm.paymentDate) {
                    this.notificationService.showErrorModal('Please enter Payment Date');
                    return;
                }
                if (this.renewalForm.paymentMode === 'Cheque' && !this.renewalForm.paymentBank) {
                    this.notificationService.showErrorModal('Please enter Bank Name for Cheque');
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
                        this.notificationService.showSuccessModal(`Policy Renewal Submitted for Issuance!\n\nThe policy is now in 'Pending Issuance' state and will be verified by the Service Team.`);
                        this.closeRenewalModal();
                        this.dataUpdated.emit();
                    },
                    error: (err: any) => this.notificationService.showErrorModal('Error renewing policy: ' + (err.error?.message || err.message))
                });
            },
            error: (err: any) => this.notificationService.showErrorModal('Error updating policy details: ' + err.message)
        });
    }

    viewDocument(type: 'payment' | 'policy' | 'claimsExcel' | 'claimsPdf' | 'underwritingDoc') {
        if (!this.selectedPolicyDetails) return;
        const id = this.selectedPolicyDetails.id;

        let request;
        if (type === 'payment') request = this.apiService.downloadPaymentProof(id);
        else if (type === 'policy') request = this.apiService.downloadPolicyDocument(id);
        else if (type === 'claimsExcel') request = this.apiService.downloadClaimsExcel(id);
        else if (type === 'claimsPdf') request = this.apiService.downloadClaimsPdf(id);
        else if (type === 'underwritingDoc') request = this.apiService.downloadUnderwritingDoc(id);

        if (!request) return;

        request.subscribe({
            next: (blob) => {
                const url = window.URL.createObjectURL(blob);
                window.open(url, '_blank');
                // Note: We can't revoke immediately if we open in new tab, 
                // browser needs time to load it. 
                setTimeout(() => window.URL.revokeObjectURL(url), 10000);
            },
            error: (err: any) => {
                console.error('Failed to view document:', err);
                const status = err?.status;
                const msg = status === 404
                    ? 'The requested document file could not be found on the server.'
                    : (status === 401 || status === 403)
                        ? 'Authentication required or session expired to view this document.'
                        : 'Failed to view document (' + (status ? 'HTTP ' + status : 'Network Error') + ').';
                this.notificationService.showErrorModal(msg);
            }
        });
    }

    async onDeletePolicy(policy: any) {
        if (await this.notificationService.confirmAction(`Are you sure you want to delete policy ${policy.policyNumber}? This action cannot be undone.`)) {
            this.apiService.deletePolicy(policy.id).subscribe({
                next: () => {
                    this.notificationService.showSuccessToast('Policy deleted successfully.');
                    this.dataUpdated.emit();
                },
                error: (err) => {
                    console.error('Error deleting policy:', err);
                    this.notificationService.showErrorModal('Failed to delete policy.');
                }
            });
        }
    }

    getDocumentsByTeam(team: string): any[] {
        if (!this.selectedPolicyDetails || !this.selectedPolicyDetails.teamDocuments) {
            return [];
        }
        return this.selectedPolicyDetails.teamDocuments.filter((doc: any) => doc.uploadedByTeam === team);
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
                this.notificationService.showSuccessToast('Policy details updated successfully!');
                this.selectedPolicyDetails = updatedPolicy; // Update view
                this.isEditing = false;
                this.dataUpdated.emit(); // Refresh parent lists
            },
            error: (err) => {
                console.error('Error updating policy:', err);
                this.notificationService.showErrorModal('Failed to update policy details.');
            }
        });
    }

    // ----------------------------------------
    // Routing & Workflow Methods
    // ----------------------------------------
    openRouteModal(policy: any) {
        this.selectedPolicy = policy;
        this.showRouteModal = true;
        if (this.isClaimsManager) this.selectedRouteTeam = 'CLAIMS';
        else if (this.isSalesManager) this.selectedRouteTeam = 'SALES';
        else if (this.isUnderwritingManager) this.selectedRouteTeam = 'UNDERWRITING';
        else this.selectedRouteTeam = '';
    }
    closeRouteModal() {
        this.showRouteModal = false;
        this.selectedRouteTeam = '';
    }
    submitRoute() {
        if (!this.selectedRouteTeam) return;
        this.apiService.routePolicy(this.selectedPolicy.id, this.selectedRouteTeam).subscribe({
            next: () => {
                this.notificationService.showSuccessToast(`Policy routed to ${this.selectedRouteTeam} Team.`);
                this.closeRouteModal();
                this.dataUpdated.emit();
            },
            error: (err: any) => {
                console.error('Error routing policy:', err);
                const msg = err.error?.message || err.message || 'Error routing policy';
                this.notificationService.showErrorModal(msg);
            }
        });
    }

    openAssignModal(policy: any) {
        this.selectedPolicy = policy;
        this.showAssignModal = true;
        this.selectedAssignUser = '';
        this.loadAvailableUsersForTeam();
    }
    closeAssignModal() {
        this.showAssignModal = false;
        this.selectedAssignUser = '';
        this.availableUsersForTeam = [];
    }
    submitAssign() {
        if (!this.selectedAssignUser) return;
        let team = '';
        if (this.isClaimsManager) team = 'CLAIMS';
        if (this.isSalesManager) team = 'SALES';
        if (this.isUnderwritingManager) team = 'UNDERWRITING';

        const userToAssign = this.selectedAssignUser === '__UNASSIGN__' ? null : this.selectedAssignUser;
        this.apiService.routePolicy(this.selectedPolicy.id, team, userToAssign).subscribe({
            next: () => {
                const isUnassign = this.selectedAssignUser === '__UNASSIGN__';
                this.notificationService.showSuccessToast(
                    `Policy ${isUnassign ? 'unassigned' : 'assigned to ' + this.selectedAssignUser}.`
                );
                this.closeAssignModal();
                this.dataUpdated.emit();
            },
            error: (err: any) => {
                console.error('Error assigning policy:', err);
                const msg = err.error?.message || err.message || 'Error assigning policy';
                this.notificationService.showErrorModal(msg);
            }
        });
    }



    async deleteDocument(policy: any, docType: string) {
        if (await this.notificationService.confirmAction('Are you sure you want to delete this document?')) {
            this.apiService.deleteDocument(policy.id, docType).subscribe({
                next: () => {
                    this.notificationService.showSuccessToast('Document deleted successfully');
                    this.dataUpdated.emit();
                },
                error: (err) => this.notificationService.showErrorModal('Error deleting document')
            });
        }
    }

    async sendBackToRenewer(policy: any) {
        if (await this.notificationService.confirmAction('Are you sure you want to send this back to the Renewer?')) {
            let sourceTeam: string | null = null;
            const as = (this.adminViewAs || this.apiService.adminViewAs || '').toLowerCase();
            if (this.isClaimsManager || this.isClaimsUser || as === 'claims') sourceTeam = 'CLAIMS';
            else if (this.isSalesManager || this.isSalesUser || as === 'sales') sourceTeam = 'SALES';
            else if (this.isUnderwritingManager || this.isUnderwritingUser || as === 'underwriting') sourceTeam = 'UNDERWRITING';
            else if (policy.targetTeam && policy.targetTeam !== 'RENEWER') sourceTeam = policy.targetTeam;
            else if (policy.lastRoutedFrom && policy.lastRoutedFrom !== 'RENEWER') sourceTeam = policy.lastRoutedFrom;
            else {
                const user = this.authService.getCurrentUser();
                const uRole = (user?.role || '').toUpperCase();
                if (uRole.includes('CLAIMS')) sourceTeam = 'CLAIMS';
                else if (uRole.includes('SALES')) sourceTeam = 'SALES';
                else if (uRole.includes('UNDERWRITING')) sourceTeam = 'UNDERWRITING';
            }




            this.apiService.routePolicy(policy.id, 'RENEWER', null, sourceTeam).subscribe({
                next: () => {
                    this.notificationService.showSuccessToast('Policy sent back to Renewer.');
                    this.dataUpdated.emit();
                },
                error: (err: any) => {
                    console.error('Error sending back to renewer:', err);
                    const msg = err.error?.message || err.message || 'Error sending back to renewer';
                    this.notificationService.showErrorModal(msg);
                }
            });
        }
    }

    // ----------------------------------------
    // Document Uploads
    // ----------------------------------------
    showRenewerUploadModal: boolean = false;
    renewerFiles: File[] = [];
    renewerNote: string = '';

    openRenewerUpload(policy: any) {
        this.selectedPolicy = policy;
        this.showRenewerUploadModal = true;
        this.renewerFiles = [];
        this.renewerNote = '';
    }
    closeRenewerUpload() {
        this.showRenewerUploadModal = false;
        this.renewerFiles = [];
        this.renewerNote = '';
    }
    onRenewerFilesSelected(event: any) {
        if (event.target.files.length > 0) {
            this.renewerFiles = Array.from(event.target.files);
        }
    }
    submitRenewerUpload() {
        const formData = new FormData();
        formData.append('team', 'RENEWER');
        if (this.renewerNote) formData.append('note', this.renewerNote);
        this.renewerFiles.forEach(file => formData.append('files', file));
        
        this.apiService.uploadTeamDocuments(this.selectedPolicy.id, formData).subscribe({
            next: () => {
                this.notificationService.showSuccessToast('Documents uploaded successfully.');
                this.closeRenewerUpload();
                this.dataUpdated.emit();
            },
            error: (err) => {
                console.error('Renewer upload error:', err);
                this.notificationService.showErrorModal('Error uploading documents: ' + (err.error?.message || err.message || JSON.stringify(err)));
            }
        });
    }

    claimsFiles: File[] = [];
    underwritingFiles: File[] = [];

    openClaimsUpload(policy: any) {
        this.selectedPolicy = policy;
        this.showClaimsUploadModal = true;
        this.claimsFiles = [];
        this.claimsNote = '';
    }
    closeClaimsUpload() {
        this.showClaimsUploadModal = false;
        this.claimsFiles = [];
        this.claimsNote = '';
    }
    onClaimsFilesSelected(event: any) {
        if (event.target.files.length > 0) {
            this.claimsFiles = Array.from(event.target.files);
        }
    }
    submitClaimsUpload() {
        const formData = new FormData();
        formData.append('team', 'CLAIMS');
        if (this.claimsNote) formData.append('note', this.claimsNote);
        this.claimsFiles.forEach(file => formData.append('files', file));
        
        this.apiService.uploadTeamDocuments(this.selectedPolicy.id, formData).subscribe({
            next: () => {
                this.notificationService.showSuccessToast('Claims files and note uploaded successfully.');
                this.closeClaimsUpload();
                this.dataUpdated.emit();
            },
            error: (err) => {
                console.error('Claims upload error:', err);
                this.notificationService.showErrorModal('Error uploading claims files: ' + (err.error?.message || err.message || JSON.stringify(err)));
            }
        });
    }

    salesFiles: File[] = [];

    openSalesNote(policy: any) {
        this.selectedPolicy = policy;
        this.showSalesModal = true;
        this.salesFiles = [];
        this.salesNote = '';
    }
    closeSalesNote() {
        this.showSalesModal = false;
        this.salesFiles = [];
        this.salesNote = '';
    }
    onSalesFilesSelected(event: any) {
        if (event.target.files.length > 0) {
            this.salesFiles = Array.from(event.target.files);
        }
    }
    submitSalesNote() {
        const formData = new FormData();
        formData.append('team', 'SALES');
        if (this.salesNote) formData.append('note', this.salesNote);
        this.salesFiles.forEach(file => formData.append('files', file));

        this.apiService.uploadTeamDocuments(this.selectedPolicy.id, formData).subscribe({
            next: () => {
                this.notificationService.showSuccessToast('Sales files and note uploaded successfully.');
                this.closeSalesNote();
                this.dataUpdated.emit();
            },
            error: (err) => {
                console.error('Sales upload error:', err);
                this.notificationService.showErrorModal('Error uploading sales documents: ' + (err.error?.message || err.message || JSON.stringify(err)));
            }
        });
    }

    openUnderwritingUpload(policy: any) {
        this.selectedPolicy = policy;
        this.showUnderwritingModal = true;
        this.underwritingFiles = [];
        this.underwritingNote = '';
    }
    closeUnderwritingUpload() {
        this.showUnderwritingModal = false;
        this.underwritingFiles = [];
        this.underwritingNote = '';
    }
    onUnderwritingFilesSelected(event: any) {
        if (event.target.files.length > 0) {
            this.underwritingFiles = Array.from(event.target.files);
        }
    }
    submitUnderwritingUpload() {
        const formData = new FormData();
        formData.append('team', 'UNDERWRITING');
        if (this.underwritingNote) formData.append('note', this.underwritingNote);
        this.underwritingFiles.forEach(file => formData.append('files', file));

        this.apiService.uploadTeamDocuments(this.selectedPolicy.id, formData).subscribe({
            next: () => {
                this.notificationService.showSuccessToast('Underwriting document uploaded.');
                this.closeUnderwritingUpload();
                this.dataUpdated.emit();
            },
            error: (err) => {
                console.error('Underwriting upload error:', err);
                this.notificationService.showErrorModal('Error uploading underwriting document: ' + (err.error?.message || err.message || JSON.stringify(err)));
            }
        });
    }

    async deleteTeamDocument(docId: number) {
        if (await this.notificationService.confirmAction(`Delete this document?`)) {
            this.apiService.deleteTeamDocument(docId).subscribe({
                next: () => {
                    this.notificationService.showSuccessToast('Document deleted.');
                    this.dataUpdated.emit();
                    // update local list if possible, but simplest is to close modal or refresh
                    if (this.selectedPolicyDetails) {
                        this.selectedPolicyDetails.teamDocuments = this.selectedPolicyDetails.teamDocuments.filter((d: any) => d.id !== docId);
                    }
                },
                error: (err) => this.notificationService.showErrorModal('Error deleting document')
            });
        }
    }

    viewTeamDocument(docId: number) {
        this.apiService.downloadTeamDocument(docId).subscribe({
            next: (blob) => {
                const url = window.URL.createObjectURL(blob);
                window.open(url, '_blank');
                setTimeout(() => window.URL.revokeObjectURL(url), 10000);
            },
            error: (err: any) => {
                console.error('Failed to view document:', err);
                const status = err?.status;
                const msg = status === 404
                    ? 'The requested document file could not be found on the server.'
                    : (status === 401 || status === 403)
                        ? 'Authentication required or session expired to view this document.'
                        : 'Failed to view document (' + (status ? 'HTTP ' + status : 'Network Error') + ').';
                this.notificationService.showErrorModal(msg);
            }
        });
    }
}
