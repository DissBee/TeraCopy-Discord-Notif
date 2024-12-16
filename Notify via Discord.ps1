param ($source, $target, [int64] $size, $time, [int64] $failed, [int64] $skipped)

write-host "Transfer completed!"
write-host "  Source: $source"
write-host "  Target: $target"
write-host "  Failed: $failed, skipped: $skipped"

$fsize = "{0:N0}" -f $size
write-host "  Size: $fsize"
write-host "  Time: $time"
write-host ""

write-host "Sending notification..."

######## Variables - change as needed ########

#Define Discord WebHook URL - paste yours here
$DiscordHookURL = "your URL here"

#put your @ codes here: Role: <@&roleID> or User: <@userID>
#Leave blank for no @
$DiscordID = ""

#Message to send
$content = @"
$DiscordID Transfer completed!
Source: $source
Target: $target
Failed: $failed, skipped: $skipped
Size: $fsize
Time: $time
"@

#Send message

$payload = [PSCustomObject]@{
content = $content
}
Invoke-RestMethod -Uri $DiscordHookURL -Method Post -Body ($payload | ConvertTo-Json) -ContentType 'Application/Json'

Start-Sleep -Seconds 5