lines = open('frontend/src/app/services/api.service.ts', encoding='utf-8').read()
lines = lines.replace('getRmNames(branch?: string): Observable<string[]> {', 'getPospNames(): Observable<string[]> {\n        return this.http.get<string[]>(${this.baseUrl}/admin/posp-names, { headers: this.getHeaders() });\n    }\n\n    getRmNames(branch?: string): Observable<string[]> {')
open('frontend/src/app/services/api.service.ts', 'w', encoding='utf-8').write(lines)
