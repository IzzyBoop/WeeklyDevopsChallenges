### Week 1 Instructions

There are a few fundamental things that you need to understand to complete this  
first week's challenge. First, everything in Powershell is an object. Second,  
Powershell has some very powerful casting features.  
  
Hold up, what's casting? I thought this was powershell not magic.  
The good news is casting is a bit of programming magic, so maybe it's both.  
All variables in powershell ($myVariable = XXX) have a type. That type can be   
specifically designated, or it can be inferred from the content of the variable.  
The following are some examples of how to assign information to variables in  
powershell.

```
$stringVariable = "This is a string"
$intVariable = 7 #This is an integer
$doubleVariable = 21.27 #This is a 'Double' or a floating point number
[string]$myString = "This is another string"
[int]$x = 7 #This is an integer as well 

```
  
...and so forth. This is fairly straightforward, however powershell can do a  
lot of work behind the scenes to help you out. Let's say you have a string  
with a number in it. If you have a string with the number 7 in it, and you  
need to perform math using that string, you can use what's call casting to  
force powershell to try and use that string as a number. This can have some  
unusual consequences when used improperly, but when used properly it's super  
helpful. 
  
Challenge 1: Use Get-ChildItem to find the file size of this  
instructions file, and output the size of the file (in GB), followed by 'GB' in a  
string. Format your answer so that it does not look like this:  
1.30478292703629E-06, but instead looks like this: .000001304783GB  
(That's 12 decimal places, by the way.)  
  
Challenge 2 : Display the name of the file in front of the size, pulling  
the name from Get-ChildItem as well.  
  
Challenge 3: Do this for an entire directory of files.  
  
Challenge 4: Use String interpolation to perform Challenge 1.  
  
If these instructions seem .. vague? It's somewhat intentional. You'll have to  
do a little bit of research to figure out what all of this means. All of the  
keywords that you would need to search for to understand this challenge are  
contained in this document. Good Luck!  