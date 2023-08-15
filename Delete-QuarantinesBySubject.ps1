function Delete-QuarantinesBySubject {
    param (
        $Subject
    )
    Get-QuarantineMessage -PageSize 1000 -Subject "$Subject" -ReleaseStatus NOTRELEASED | Delete-QuarantineMessage
}
