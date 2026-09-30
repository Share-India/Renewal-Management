lines = open('backend/src/main/java/com/insurance/renewal/controller/AuthController.java', encoding='utf-8').readlines()

new_lines = []
for line in lines:
    if '    @GetMapping("/admin/users")' in line:
        new_lines.append('    @GetMapping("/admin/posp-names")\n')
        new_lines.append('    @org.springframework.security.access.prepost.PreAuthorize("hasAuthority(\'ADMIN\') or hasRole(\'ADMIN\')")\n')
        new_lines.append('    public ResponseEntity<java.util.List<String>> getPospNames() {\n')
        new_lines.append('        return ResponseEntity.ok(policyRepository.findDistinctAssociateNames());\n')
        new_lines.append('    }\n\n')
        new_lines.append(line)
    elif '            user.setAssignedRm(payload.get("assignedRm"));' in line:
        new_lines.append(line)
        new_lines.append('        } else if (role.contains("POSP")) {\n')
        new_lines.append('            user.setAssignedPosp(payload.get("assignedPosp"));\n')
    else:
        new_lines.append(line)

open('backend/src/main/java/com/insurance/renewal/controller/AuthController.java', 'w', encoding='utf-8').writelines(new_lines)
