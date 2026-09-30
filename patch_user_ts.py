lines = open('frontend/src/app/components/user-management/user-management.component.ts', encoding='utf-8').read()

# Add assignedPosp to newUser
lines = lines.replace('assignedRm: \'\'', 'assignedRm: \'\', assignedPosp: \'\'')

# Add POSP state variables
lines = lines.replace('availableRmNames: string[] = [];', 'availableRmNames: string[] = [];\n  availablePospNames: string[] = [];\n  selectedPosp: string = \'\';\n  pospSearchTerm: string = \'\';')

# Add POSP getter
lines = lines.replace('get filteredRms(): string[] {', 'get filteredPosps(): string[] {\n    if (!this.pospSearchTerm) return this.availablePospNames;\n    const term = this.pospSearchTerm.toLowerCase();\n    return this.availablePospNames.filter(r => r.toLowerCase().includes(term));\n  }\n\n  get filteredRms(): string[] {')

# Add fetch call in extractBranches (where getRmNames is likely called, wait, getRmNames is called where?)
# Actually I'll just add it to ngOnInit
lines = lines.replace('this.extractBranches();', 'this.extractBranches();\n    this.apiService.getPospNames().subscribe(names => this.availablePospNames = names);')

# Update createUser()
lines = lines.replace('} else if (this.newUser.role === \'RM\') {', '} else if (this.newUser.role === \'POSP\') {\n      this.newUser.assignedPosp = this.selectedPosp;\n      this.newUser.assignedRm = \'\';\n      this.newUser.assignedProductType = \'\';\n      this.newUser.assignedPremiumRange = \'\';\n      this.newUser.assignedCustomers = \'\';\n    } else if (this.newUser.role === \'RM\') {')

open('frontend/src/app/components/user-management/user-management.component.ts', 'w', encoding='utf-8').write(lines)
