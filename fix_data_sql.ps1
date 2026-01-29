$path = "c:\Users\Sagar Dagle\.gemini\antigravity\scratch\insurance-renewal-app\backend\src\main\resources\data.sql"
$lines = Get-Content $path
$seenEmails = @{}
$fixedLines = @()

foreach ($line in $lines) {
    if ($line -match "INSERT INTO customers .* VALUES \((\d+), .*'([^']+)@([^']+)'.*\)") {
        $id = $matches[1]
        $emailLocal = $matches[2]
        $emailDomain = $matches[3]
        $fullEmail = "$emailLocal@$emailDomain".ToLower()

        if ($seenEmails.ContainsKey($fullEmail)) {
            $newEmail = "${emailLocal}_${id}@${emailDomain}"
            $newLine = $line -replace "'$fullEmail'", "'$newEmail'"
            $fixedLines += $newLine
            Write-Host "Fixed duplicate email for ID ${id}: $fullEmail -> $newEmail"
        } else {
            $seenEmails[$fullEmail] = $true
            $fixedLines += $line
        }
    } else {
        $fixedLines += $line
    }
}

$utf8NoBom = New-Object System.Text.UTF8Encoding $false
[System.IO.File]::WriteAllLines($path, $fixedLines, $utf8NoBom)
Write-Host "Done fixing data.sql"
