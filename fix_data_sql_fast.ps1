$path = "c:\Users\Sagar Dagle\.gemini\antigravity\scratch\insurance-renewal-app\backend\src\main\resources\data.sql"
$tempPath = "$path.tmp"
$reader = [System.IO.File]::OpenText($path)
$writer = [System.IO.File]::CreateText($tempPath)
$seenEmails = New-Object System.Collections.Generic.HashSet[string] ([System.StringComparer]::OrdinalIgnoreCase)

try {
    while (($line = $reader.ReadLine()) -ne $null) {
        if ($line.StartsWith("INSERT INTO customers")) {
             if ($line -match "VALUES \((\d+), .*'([^']+)@([^']+)'.*\)") {
                 $id = $matches[1]
                 $fullEmail = "$($matches[2])@$($matches[3])"
                 if ($seenEmails.Contains($fullEmail)) {
                      $newEmail = "$($matches[2])_${id}@$($matches[3])"
                      # Safe replace only the email
                      $line = $line.Replace("'$fullEmail'", "'$newEmail'")
                      Write-Host "Fixed ${id}: $fullEmail -> $newEmail"
                 } else {
                      $seenEmails.Add($fullEmail) | Out-Null
                 }
             }
        }
        $writer.WriteLine($line)
    }
} finally {
    $reader.Close()
    $writer.Close()
}
Move-Item -Force $tempPath $path
Write-Host "Done fixing data.sql"
