param ($source, $target, [int64] $size, $time, [int64] $failed, [int64] $skipped)

######## Variables - change as needed ########
#Size formatting
$fsize = "{0:N0}" -f $size

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

######## SEND THE MESSAGE ########
#create payload
$payload = [PSCustomObject]@{
content = $content
}
#do the actual send
Invoke-RestMethod -Uri $DiscordHookURL -Method Post -Body ($payload | ConvertTo-Json) -ContentType 'Application/Json'
#sleep for 2 seconds just in case
Start-Sleep -Seconds 2
