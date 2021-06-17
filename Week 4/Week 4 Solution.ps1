$url = "https://api.thecatapi.com/v1/images/search"
$gifurl = "https://api.thecatapi.com/v1/images/search?mime_types=gif"

# Challenge 1
Function Get-RandomCatPicture {
    param (
        [switch]$AnimatedOnly
    )

    if ($AnimatedOnly) {
        $cat = (Invoke-RestMethod -URI $gifurl).url
        Start-Process $cat
    } else {
        $cat = (Invoke-RestMethod -URI $url).url
        Start-Process $cat
    }
}

#Challenge 2
Function Get-CatByBreed {
    param (
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]$breed
    )
    $breedurl = "https://api.thecatapi.com/v1/images/search?breed_ids=$breed"
    $cat = (Invoke-RestMethod -URI $breedurl).url
    Start-Process $cat
}

# Challenge 3
# The below function was stolen from Scott for educational purposes
Function Send-CatPicture {
    param (
      [string]$fileName
    )
    $catAPIKey = get-content "API KEY PATH"
    if (!(Test-Path $fileName)) {
      Write-Output "Naughty. You have to provide a path to a real cat"
      return
    }
    
    $headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
    $headers.Add("Content-Type", "multipart/form-data")
    $headers.Add("x-api-key", $catAPIKey)
  
  $multipartContent = [System.Net.Http.MultipartFormDataContent]::new()
  $multipartFile = $fileName
  $FileStream = [System.IO.FileStream]::new($multipartFile, [System.IO.FileMode]::Open)
  $fileHeader = [System.Net.Http.Headers.ContentDispositionHeaderValue]::new("form-data")
  $fileHeader.Name = "file"
  $fileHeader.FileName = Split-Path $fileName -Leaf
  $fileContent = [System.Net.Http.StreamContent]::new($FileStream)
  $fileContent.Headers.ContentDisposition = $fileHeader
  $fileContent.Headers.ContentType = [System.Net.Http.Headers.MediaTypeHeaderValue]::Parse("image/jpg")
  $multipartContent.Add($fileContent)
  
  $stringHeader = [System.Net.Http.Headers.ContentDispositionHeaderValue]::new("form-data")
  $stringHeader.Name = "sub_id"
  $stringContent = [System.Net.Http.StringContent]::new("")
  $stringContent.Headers.ContentDisposition = $stringHeader
  $multipartContent.Add($stringContent)
  
  $body = $multipartContent
  
  $response = Invoke-RestMethod 'https://api.thecatapi.com/v1/images/upload' -Method 'POST' -Headers $headers -Body $body
  return $response | ConvertTo-Json
  }
  #>