### Week 4 Instructions

No longwinded explanations this time around. An API is a web-based endpoint  
that you can retrieve data from. There are numerous ways to do this in powershell  
but the main 2 you'll want to look at for this excercise are Invoke-RESTMethod and  
the System.Net.WebClient class. Typically you will not fall back to the  
System.Net.WebClient class unless you need to support Powershell 2.0 - For this  
excercise you do not need to support Powershell 2. Extra credit if you can pull  
it off, but fair warning it is a degree of difficulty that I would not expect  
most people to be up for.  

You have a single challenge for this week. Sign up for the API access at  
https://thecatapi.com/ and build the following functions  

Get-RandomCatPicture - Display a random cat picture in a window/the browser.  
Include in this function a switch -AnimatedOnly which will fetch only Animated  
cat pictures.  

Get-CatByBreed - Display textual information about a specific breed of cat as  
specified by the user  

Send-CatPicture - Upload a cat picture (path specified by user).  

As always, I am available to help if something isn't coming together as well  
as you hope. 
