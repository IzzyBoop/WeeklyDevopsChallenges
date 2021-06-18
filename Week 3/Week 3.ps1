Function Test-Challenge1 {
  param (
        [Parameter(Mandatory = $true, Position=0)]
        [array] $array,

        [Parameter(Mandatory = $true, Position=1)]
        [ValidateNotNullOrEmpty()]
        [string] $string
  )

    if ($array -contains $string) {
        Write-Error "String value already present in provided array"
    } else {
        $array += $string
        return $array
    }
}

Function Test-Challenge2 {
  param (
    [array] $array
  )

    if ($array.count -eq 0) {
        Write-Error "Array is empty, like your damn head"
    } else {
        if ($array.count -gt 1) {
            $store = @($array[0..($array.count-2)]) # store all but last item
            $newArray += @((Get-Culture).TextInfo.ToUpper($array[-1])) # add and capitalize last item to new array
            $array = @($store) # set stored array items to original array
            Test-Challenge2 $array # call function onto new shorter array
            return $newArray # return the result
            # cry yourself to sleep because youre incapable of basic human thought.
        } else {
            return (Get-Culture).TextInfo.ToTitleCase($array[0])
        }
    }

}

Function Test-Challenge3 {
  param (
    [Parameter(Position=0)]
    [ValidateNotNullOrEmpty()]
    [String]$Path = 'V:\Programming\Miles\Miles Weekly Devops\'
  )

  if (Test-Path $Path -eq $false) {
    Write-Error "Path invalid"
    return
  }

  $fileArray = @()
  $files = (Get-ChildItem -recurse $Path -File | Select-object Name)
  foreach ($file in $files) {
    $fileArray = Test-Challenge1 $fileArray $file
  }
  return $fileArray
}


Function Test-Challenge4 {

  Param (
    [Parameter(Mandatory = $True, Position=0, ParameterSetName="CelsiusToFahrenheit")]
    [Parameter(Mandatory = $True, Position=0, ParameterSetName="FahrenheitToCelsius")]
    [ValidateNotNullOrEmpty()]
    [decimal]$Temperature,
    [Parameter(ParameterSetName="CelsiusToFahrenheit")]
    [switch]$CelsiusToFahrenheit,
    [Parameter(ParameterSetName="FahrenheitToCelsius")]
    [switch]$FahrenheitToCelsius
  )
  if ($FahrenheitToCelsius.IsPresent) {
    return [math]::Round([decimal](($Temperature-32)*(5/9)),2)
  }

  if ($CelsiusToFahrenheit.IsPresent) {
    return [math]::Round([decimal](($Temperature*(9/5))+32),2)
  }
}


## DO NOT CHANGE THIS SECTION ##
$challenge1Input = @("red","blue","purple")
$challenge2Input = @("AppLe","PeaR","vacation","TIREIRON","electr0n","magical","zebra","ohIO","sulAamethoxazole","white stripes","screwdriver")
$challenge3Results = Test-Challenge3
Write-Output $challenge3Results
Write-Output "0 degrees Celsius is $(Test-Challenge4 0.0 -CelsiusToFahrenheit) degrees Fahrenheight"
Write-Output "-50 degrees Celsius is $(Test-Challenge4 -50 -CelsiusToFahrenheit) degrees Fahrenheight"
Write-Output "214.2 degrees Celsius is $(Test-Challenge4 214.2 -CelsiusToFahrenheit) degrees Fahrenheight"
Write-Output "0 degrees Fahrenheit is $(Test-Challenge4 0.0 -FahrenheitToCelsius) degrees Celsius"
Write-Output "100 degrees Fahrenheit is $(Test-Challenge4 100.0 -FahrenheitToCelsius) degrees Celsius"
## END OF DO NOT CHANGE THIS SECTION ##

## Your code Goes here ##

Test-Challenge1 $challenge1Input red
Test-Challenge1 $challenge1Input green
Test-Challenge1 $challenge1Input orange
Write-Output $challenge1Input
Test-Challenge2 $challenge2Input
