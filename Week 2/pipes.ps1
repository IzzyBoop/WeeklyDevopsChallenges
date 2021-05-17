# hello darkness my old friend

function Challenge1 {
    return Get-EventLog -LogName Application | Where-Object {$_.EventID -eq 10000}
}

function Challenge2 {
    return Challenge1 | Select-Object Time, EntryType, Message
}

function Challenge3 {
    return Get-ChildItem $pwd | Where-Object { $_.Name -notmatch '[aeiouy]' }
    # 'y' is a vowel, y'all are just mean.
}

function Challenge4 {
    return Get-ChildItem $pwd | Where-Object { $_.LastAccessTime -ge ((Get-Date).AddDays(-1)) }
    # please add -1 days thanks
}

function Challenge5 {
    return Get-EventLog -LogName System -After '00:00' -Before '05:00' | Where-Object {$_.EventID -eq 10000} | ForEach-Object {
        Write-Output "$($_.TimeGenerated) - $($_.Message)"
    }
}

Write-Output "Challenge 1"
Challenge1
Read-Host "Press ENTER to continue"

Write-Output "Challenge 2"
Challenge2
Read-Host "Press ENTER to continue"

Write-Output "Challenge 3"
Challenge3
Read-Host "Press ENTER to continue"

Write-Output "Challenge 4"
Challenge4
Read-Host "Press ENTER to continue"

Write-Output "Challenge 5"
Challenge5
Read-Host "Press ENTER to continue"
