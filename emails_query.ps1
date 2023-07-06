function Get-Emails{
    param (
        [string]$RecipientEmail,
        [string]$SenderEmail
    )
    Clear-Host
    
    if ($SenderEmail) {
            Get-MessageTrace -RecipientAddress $RecipientEmail -SenderAddress $SenderEmail -PageSize 5000 | Select-Object Subject,
        @{Name="Received"; Expression={$_.Received.ToLocalTime()}},
        SenderAddress,RecipientAddress,FromIP,Status,
        Size,MessageTraceId | more
    } else {
            Get-MessageTrace -RecipientAddress $RecipientEmail -PageSize 5000 | Select-Object Subject,
        @{Name="Received"; Expression={$_.Received.ToLocalTime()}},
        SenderAddress,RecipientAddress,FromIP,Status,
        Size,MessageTraceId | more
    }
}
