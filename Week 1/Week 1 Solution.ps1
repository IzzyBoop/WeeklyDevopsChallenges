#Week 1 Challenge

#Create Function to convert bytes to GB string
Function Convert-GBtoString {
  param (
    $bytes
  )
  $converted = ($bytes/1GB).ToString("#.############") + "GB" 

  # Add a damn 0 to the front, homie
  if ($bytes/1GB -lt 1) {
    return "0" + $converted
    } else {
    return $converted
    }
}

# Challenge Step 1
Write-Output "Step 1"
$file = Get-ChildItem "Week 1 Instructions.md"
$fileSize = $file.length
$sizeString = Convert-GBtoString($fileSize)
$sizeString 
Write-Output "----------"

# Challenge Step 2: Electric Boogaloo
Write-Output "Step 2"
$fileName = $file.Name
$fileNameAndSize = $fileName + " " + $sizeString
$fileNameAndSize 
Write-Output "----------"

# Challenge Step 3
Write-Output "Step 3"
Get-ChildItem $pwd | foreach-Object {
    $fileSize = $_.length
    $sizeString = Convert-GBtoString($fileSize)
    $fileName = $_.Name
    $fileNameAndSize = $fileName + " " + $sizeString
    $fileNameAndSize
}
Write-Output "----------"

# Challenge Step 4, the string interpolation version
Write-Output "Step 4"
$file = Get-ChildItem "Week 1 Instructions.md"
$fileSize = ($file.length/1GB).ToString("#.############")
Write-Output "The File Size is $filesize GB"