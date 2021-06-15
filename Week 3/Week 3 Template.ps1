Function Test-Challenge1 {
  param (

  )
}

Function Test-Challenge2 {
  param (

  )
}

Function Test-Challenge3 {
  param (

  )
}

Function Test-Challenge4 {
  param (

  )
}

## DO NOT CHANGE THIS SECTION ##
$challenge1Input = @("red","blue","purple")
$challenge2Input = @("AppLe","PeaR","vacation","TIREIRON","electr0n","magical","zebra","ohIO","sulAamethoxazole","white stripes","screwdriver")
$challenge3Results = Test-Challenge3
Write-Output "$($challenge3Results -join ",")"
Write-Output "0 degrees Celsius is $(Test-Challenge4 [decimal]0 -CelsiusToFahrenheit) degrees Fahrenheight"
Write-Output "-50 degrees Celsius is $(Test-Challenge4 [decimal]-50 -CelsiusToFahrenheit) degrees Fahrenheight"
Write-Output "214.2 degrees Celsius is $(Test-Challenge4 [decimal]214.2 -CelsiusToFahrenheit) degrees Fahrenheight"
Write-Output "0 degrees Fahrenheit is $(Test-Challenge4 [decimal]0 -FahrenheitToCelsius) degrees Celsius"
Write-Output "100 degrees Fahrenheit is $(Test-Challenge4 [decimal]100.0 -FahrenheitToCelsius) degrees Celsius"
## END OF DO NOT CHANGE THIS SECTION ##


## Your code Goes here ##