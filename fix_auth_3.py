lines = open('backend/src/main/java/com/insurance/renewal/controller/AuthController.java', encoding='utf-8').read()
lines = lines.replace('        }\n        } else if (role.contains("POSP")) {', '        } else if (role.contains("POSP")) {')
open('backend/src/main/java/com/insurance/renewal/controller/AuthController.java', 'w', encoding='utf-8').write(lines)
