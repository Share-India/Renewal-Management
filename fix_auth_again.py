lines = open('backend/src/main/java/com/insurance/renewal/controller/AuthController.java', encoding='utf-8').readlines()

# Add getPospNames endpoint
for i, line in enumerate(lines):
    if '    @GetMapping("/admin/users")' in line:
        lines.insert(i, '    @GetMapping("/admin/posp-names")\n    @org.springframework.security.access.prepost.PreAuthorize("hasAuthority(\'ADMIN\') or hasRole(\'ADMIN\')")\n    public ResponseEntity<java.util.List<String>> getPospNames() {\n        return ResponseEntity.ok(policyRepository.findDistinctAssociateNames());\n    }\n\n')
        break

# Add POSP to createUser
for i, line in enumerate(lines):
    if '            user.setAssignedRm(payload.get("assignedRm"));' in line:
        lines.insert(i + 2, '        } else if (role.contains("POSP")) {\n            user.setAssignedPosp(payload.get("assignedPosp"));\n')
        break

open('backend/src/main/java/com/insurance/renewal/controller/AuthController.java', 'w', encoding='utf-8').writelines(lines)
