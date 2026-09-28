$content = Get-Content -Path frontend/src/app/components/admin-dashboard/admin-dashboard.component.ts -Raw
$newFunc = @"
  exportTodaysReport(): void {
    const todayStr = new Date().toDateString();

    const formatRecord = (r: any): any => {
      const c = r.customer;
      const rem = r.reminder;
      const actPolicy = rem?.policy || r;

      let updatedToday = false;
      if (rem && rem.lastReminderSentAt) {
        const updatedDate = new Date(rem.lastReminderSentAt).toDateString();
        if (updatedDate === todayStr) {
          updatedToday = true;
        }
      }

      const policyEndDate = actPolicy.policyEndDate;
      const policyStartDate = actPolicy.policyStartDate;
      const expiryDate = actPolicy.expiryDate;
      const insuranceName = actPolicy.insuranceName;
      const type = actPolicy.type;
      const amount = actPolicy.amount;
      const productName = actPolicy.productName;
      const rmName = actPolicy.rmName;
      const associateName = actPolicy.associateName;
      const associateCode = actPolicy.associateCode;
      const vehicleRegNo = actPolicy.vehicleRegNo;
      const vehicleModel = actPolicy.vehicleModel;
      const paymentDate = actPolicy.paymentDate;
      const branch = actPolicy.branch;

      return {
        'Sr. No.': '',
        'FY': policyEndDate ? new Date(policyEndDate).getFullYear() : new Date().getFullYear(),
        'Customer Name': c ? `${c.firstName || ''} ${c.lastName || ''}`.trim() : '',
        'DOB': c?.dob || '',
        'Contact No': c?.phone || '',
        'Email ID': c?.email || '',
        'Policy No': actPolicy.policyNumber || r.policyNumber || '',
        'Insurance Type': type || '',
        'Insurer Name': insuranceName || '',
        'Policy Start Date': policyStartDate || '',
        'Policy End Date': policyEndDate || '',
        'Renewal Due date': expiryDate || '',
        'Product Name': productName || '',
        'Amount': amount || '',
        'Premium': amount || '',
        'RM Name': rmName || '',
        'Associate name': associateName || '',
        'Associate Code': associateCode || '',
        'Address 1': c?.address || '',
        'City': c?.city || '',
        'State': c?.state || '',
        'Pin Code': '',
        'Car/RegNo': vehicleRegNo || '',
        'Model Name': vehicleModel || '',
        'Mgf Year': '',
        'Billing Frequency': c?.billingFrequency || '',
        'PPT': '',
        'PT': '',
        'Payment Date': paymentDate || '',
        'Branch': branch || '',
        'Renewer Name': (updatedToday && rem?.lastUpdatedBy && rem?.lastUpdatedBy !== 'System') ? rem.lastUpdatedBy : '',
        'Outcome': updatedToday ? (rem?.lastCallOutcome || '') : '',
        'Renewer Note': updatedToday ? (rem?.notes || '') : '',
        'Update Time': (updatedToday && rem?.lastReminderSentAt) ? new Date(rem.lastReminderSentAt).toLocaleTimeString() : ''
      };
    };

    const exportData: any[] = [];
    let index = 1;

    if (this.allTodaysExpiring.length > 0) {
      exportData.push({ 'Sr. No.': '==== EXPIRING POLICIES ====' });
      this.allTodaysExpiring.forEach(p => {
        const row = formatRecord(p);
        row['Sr. No.'] = index++;
        exportData.push(row);
      });
    }

    if (this.allTodaysFollowUps.length > 0) {
      exportData.push({ 'Sr. No.': '==== TODAYS FOLLOW-UPS ====' });
      this.allTodaysFollowUps.forEach(p => {
        const row = formatRecord(p);
        row['Sr. No.'] = index++;
        exportData.push(row);
      });
    }

    if (this.allTodaysUpdated.length > 0) {
      exportData.push({ 'Sr. No.': '==== UPDATED TODAY ====' });
      this.allTodaysUpdated.forEach(p => {
        const row = formatRecord(p);
        row['Sr. No.'] = index++;
        exportData.push(row);
      });
    }

    if (exportData.length === 0) {
      this.notificationService.showErrorModal("No records loaded yet. Please click on 'Today's Work Count' to load the data before downloading.");
      return;
    }

    const worksheet = XLSX.utils.json_to_sheet(exportData);
    const workbook = XLSX.utils.book_new();
    XLSX.utils.book_append_sheet(workbook, worksheet, 'Todays Updates');

    const formattedDate = new Date().toISOString().split('T')[0];
    XLSX.writeFile(workbook, `Daily_Renewer_Report_${formattedDate}.xlsx`);
  }
"@

$content = $content -replace '(?s)  exportTodaysReport\(\): void \{.*?error: \(err\) => \{.*?\}\s*\}\);\s*\}', $newFunc
Set-Content -Path frontend/src/app/components/admin-dashboard/admin-dashboard.component.ts -Value $content
