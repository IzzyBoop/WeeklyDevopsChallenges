### Week 3 Instructions

Functions and Parameters. You've seen me use functions the last 2 weeks to answer  
the challenges, but why should you use a function? When should you use a function?  
The core benefit of writing a function is centered in a concept in development  
known as DRY. This stands for Don't Repeat Yourself.  The best reason to use a  
function is to reduce the amount of code that lives in your main code body  
A general rule of thumb is that if you have to do the same thing more than twice  
it probably should be a function if it can be.  

So what's a parameter? A parameter is a way that you can customize the inforamtion  
that a function has. This allows you to write your function in a more generic way  
that applies to more situations.  An example of a function that we use when writing  
RMM scripts is here:  
```
Function Test-RegistryKey {
  [CmdletBinding()]
  param
  (
      [Parameter(Mandatory = $true)]
      [ValidateNotNullOrEmpty()]
      [string]$Key
  )

  if (Get-Item -Path $Key -ErrorAction Ignore) {
      return $true
  } else {
    return $false
  }
}
```
This Function has some parameter decorations we can talk about, but first let's  
talk about what this function does. It tests whether a registry key is present  
or not and returns true or false.  The parameter that gets passed in is Mandatory  
and the parameter that gets passed in must not be null or empty.  It also is typed  
as a string, and it's name is $Key. This means in the function we can use $Key,  
and it will be whatever string has been passed into the function when it was  
called. So in the above, we do a Get-Item with a path of the passed in string $Key  
and ignore any errors as part of an if statement. In Powershell when a cmdlet  
fails, the returned value is $null, and if ($null) is false.  So here if a value  
is returned from get-item, this function returns $true, otherwise it returns $false  

So for example let's say I have an application that stores it's uninstall string  
in one of 3 places based on what version is installed, using the above I can test  
all 3 locations and based on the results of my queries, I know which uninstall  
commands to use, based on which version(s) I detect. 

For this week's challenges you will be writing some functions, and then using  
them in code.  You will use the Week 3 Template for your code, and you will use  
the precoded information that I provide for your inputs.

Challenge 1: Write a function which takes 2 values, an array of strings and a  
string. The function should output the text to the console, and also returns the  
array with the string appended to the array as an element. eg: If I pass in an  
array with Apple, Orange, Banana and the string Peach, the function will write  
Peach to the console, and add Peach to the end of the Apple, Orange, Banana  
array so it would be Apple Orange, Banana, Peach.  Validate that the string is  
not empty or null. The Array may be empty or null. Do not allow your function to  
add a color that already exists to the array, print an error and do not add to  
the array if a duplicate item is passed. Add At least 3 new colors to the array  
in your main code, add at least 1 color that already exists to the array to  
demonstrate that your error checking works. 

Challenge 2: Write a recursive function. (Google this if you don't know what this  
means.) This function should take an array of strings and capitalize every string  
in the array. Validate that the Array is not Empty or null. Throw an error if the  
initial array is empty or null, but do not throw an error at the end of your  
recursive chain.  

Challenge 3 (the softball challenge): 
Write a function that adds all filenames (and filenames of files in subfolders)  
from a parameter provided directory to an array using the Challenge 1 function  
Make the default value of the parameter the path to your weeklydevopschallenge  
folder, so that if no parameter is provided, it will default to that folder.  
Validate that the provided folder is a valid folder before executing. Return  
the array.

Challenge 4:
Write a function that takes a decimal value and one of two switches  
CelsiusToFarenheit or FarenheightToCelsius. Do not allow the use of Both  
switches. Only allow one or the other. (Note: See the MilesRMM module function  
Get-ApplicationList for an example of how this is done.) Return the temperature  
modified by the appropriate function based on which switch is present. Round all  
temperatures to 2 decimal points.  Validate that your decmial value is not null.  
Throw an error if it is.

