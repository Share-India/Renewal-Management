$headers = @{
    Authorization = "Basic " + [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes("ShareIndia:ShareIndia@123"))
}

try {
    $response = Invoke-RestMethod -Uri "http://localhost:8080/api/auth/login" -Method Get -Headers $headers -ErrorAction Stop
    Write-Host "Login SUCCESS!"
    Write-Host "Response: " ($response | ConvertTo-Json)
} catch {
    Write-Host "Login FAILED!"
    Write-Host "Exception Message: " $_.Exception.Message
    if ($_.Exception.Response) {
        Write-Host "Status Code: " $_.Exception.Response.StatusCode.value__
        Write-Host "Status Description: " $_.Exception.Response.StatusDescription
        if ($_.Exception.Response.GetResponseStream()) {
           $reader = New-Object System.IO.StreamReader($_.Exception.Response.GetResponseStream())
           Write-Host "Body: " $reader.ReadToEnd()
        }
    } else {
        Write-Host "No response received from server."
    }
}
