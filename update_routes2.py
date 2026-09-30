lines = open('frontend/src/app/app.routes.ts', encoding='utf-8').read()
lines = lines.replace("data: { roles: ['ADMIN', 'RM'] }", "data: { roles: ['ADMIN', 'RM', 'POSP'] }")
open('frontend/src/app/app.routes.ts', 'w', encoding='utf-8').write(lines)
