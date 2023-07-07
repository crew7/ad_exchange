function Get-Emails {
    param (
        [string]$RecipientEmail,
        [string]$MessageTraceId,
        [string]$SenderEmail
    )
    Clear-Host

    $params = @{PageSize = 5000}
    
    if ($SenderEmail) { $params += @{SenderAddress = $SenderEmail} }
    if ($RecipientEmail) { $params += @{RecipientAddress = $RecipientEmail} }
    if ($MessageTraceId) { $params += @{MessageTraceId = $MessageTraceId} }

    Get-MessageTrace @params | Select-Object Subject,
        @{Name="Received"; Expression={$_.Received.ToLocalTime()}},
        SenderAddress,RecipientAddress,FromIP,Status,
        Size,MessageTraceId | more
}
