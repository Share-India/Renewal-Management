lines = open('backend/src/main/java/com/insurance/renewal/service/RenewalService.java', encoding='utf-8').readlines()
for i, line in enumerate(lines):
    if 'boolean isRmOrRenewer = user != null && user.getRole() != null && (user.getRole().contains("RM") || user.getRole().contains("RENEWER"));' in line:
        lines[i] = line.replace('boolean isRmOrRenewer', 'boolean isRmOrRenewerOrPosp').replace('user.getRole().contains("RENEWER")', 'user.getRole().contains("RENEWER") || user.getRole().contains("POSP")')
    elif 'if (isRmOrRenewer) {' in line:
        lines[i] = line.replace('isRmOrRenewer', 'isRmOrRenewerOrPosp')
open('backend/src/main/java/com/insurance/renewal/service/RenewalService.java', 'w', encoding='utf-8').writelines(lines)
