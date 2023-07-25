function Get-QuarantineEmail {
    param (
        [string]$User,
        [string]$NetworkMessageId
    )
    Get-QuarantineMessage -RecipientAddress $User | Where-Object {$_.identity -like "*$NetworkMessageId*"} | 
    Select-Object Identity, ReceivedTime,  MessageId, SenderAddress, RecipientAddress, Subject,
    Size, Type, PolicyType, PolicyName, TagName, ReleaseStatus, Direction, EntityType, Expires

}