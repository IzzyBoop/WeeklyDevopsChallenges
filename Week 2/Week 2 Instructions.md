### Week 2 Instructions

What's in a pipe? That's the point of this week's challenge. Pipes are a way  
to take powershell output and redirect them into other commandlets, other  
output streams, and generally chain commands together to construct useful data  

As we covered in Week 1, commandlets return objects. A very basic example of  
the utility of a pipe, is to format output of a returned object, or to select  
only certain properties of a returned object.   

```
Get-Item .\README.md | Format-List
Get-Item .\README.md | Format-List *
Get-Item .\README.md | Format-Table
```

Executing these commands, you'll see that one of the properties of this file  
is the VersionInfo property. The VersionInfo property has some other properties  
of its own, which we may want to try to access. Check out the following:

```
Get-Item .\README.md | Select-Object VersionInfo
Get-Item .\README.md | Select-Object VersionInfo | Format-List
Get-Item .\README.md | Select-Object -expand VersionInfo | Format-List
(Get-Item .\README.md | Select-Object -expand VersionInfo).FileName
```

So, what's going on here? The first block of code is showing you formatted  
versions of the information in the README.md file, via list and table.  
Format-List * shows even properties typically hidden from view due to lesser use.  
In the second code block, by piping to Select-Object we are narrowing down which  
parts of the returned object we care about. We only care about the VersionInfo  
section. Using the -expand flag on select-object we make sure we can see all the  
subproperties of VersionInfo. In the final form (with parenethesis) we are  
forcing the command to complete and return an object and then using only one  
specific property of the VersionInfo object (FileName). Some other very common  
things that you can use a pipe to redirect an object to are filters and loops.  
Execute the following command in the root of the weeklydevopschallenge folder.  

```
Get-Childitem | Where-Object {$_.PSisContainer -eq $true}
Get-Childitem | Where-Object {$_.PSisContainer -eq $true} | Foreach-Object {Write-Output $_.FullName}
```

The above commands get a list of items in the folder which are themselves folders  
(PSisContainer is true). But you may notice there's a weird $_ syntax. This syntax  
requires a little bit of explaining. $_ basically refers to 'the currently passed  
object.'  What this means is that we have a list of things (Get-ChildItem) and  
we are passing each member of that list of things once to the piped command. So  
in the first command, Where-Object is filtering the objects and discarding any  
objects that are not containers (folders).  In the second command, we are taking  
the filtered list of folders, and for each of them, writing the FullName property  
to the output stream (so the full path of the folder)  

For this week's excercises, you will perform the following:  

Challenge 1: Get a list of all Events in the Application log with an event ID of 10000  

Challenge 2: Get a list of all Events in the Application log, with an event ID of 10000  
and for each event captured print out the type of Entry (information/error etc), and  
the Time the event was generated, as well as the Message associated with it.  

Challenge 3: Get a list of all files on your local computer which have no  
vowels in the filename.  

Challenge 4: Get a list of all files on your local computer which have a  
Last Access time within the last 24 hours.  

Challenge 5:  Get a list of all events in the Application log, with an event ID of 10000  
and for each event captured, test if the event occurred during the hours of midnight-5am, and  
print the time the event was generated, as well as the message assocated with it.  
