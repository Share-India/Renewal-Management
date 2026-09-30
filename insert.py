lines = open('backend/src/main/java/com/insurance/renewal/controller/AuthController.java', encoding='utf-8').readlines()
lines.insert(71, '        } else if (role.contains("POSP")) {\n            user.setAssignedPosp(payload.get("assignedPosp"));\n')
open('backend/src/main/java/com/insurance/renewal/controller/AuthController.java', 'w', encoding='utf-8').writelines(lines)
