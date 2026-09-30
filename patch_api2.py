lines = open('frontend/src/app/services/api.service.ts', encoding='utf-8').read()
import re
lines = re.sub(r'getPospNames\(\): Observable<string\[\]> \{[\s\S]*?\}', 'getPospNames(): Observable<string[]> {\\n        return this.http.get<string[]>(this.baseUrl + \\'/admin/posp-names\\', { headers: this.getHeaders() });\\n    }', lines)
open('frontend/src/app/services/api.service.ts', 'w', encoding='utf-8').write(lines)
