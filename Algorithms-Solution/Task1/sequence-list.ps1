<#
Given:
A sequence of digits (file task1). It requires you to review a sequence of digits and find the sum of all digits that match the next digit in the list. 
The list is circular, so the digit after the last digit is the first digit in the list. 
For example:
1122 produces a sum of 3 (1 + 2) because the first digit 1 matches the second digit and the third digit 2 matches the fourth digit;
1111 produces 4 because each digit (all 1) matches the next;
1234 produces 0 because no digit matches the next;
91212129 produces 9 because the only digit that matches the next one is the last digit, 9
To Do:
What is the solution to your sequence? (using PowerShell)
#>
<#
Explanation of my Logic:
Step 1: Take the filename (with path) as an input, read and assign the data to a variable.
Step 2: Iterate over the stored data.
Step 3: For the circular match, compare $i and $i-1. So when $i is 0 it will compare first and the last
Step 4: If the digit mathces the digit next to it then store it in an array

Note: Uncomment the write-hosts when need to debug.
#>
Write-Host "Welcome to the sequence list program!"
$filename = Read-Host -Prompt 'Input filename with the complete path: '
#/Users/robhit_saxena/work_area/powershell-work/algo2
#=> Checking if the file exists or not.
$checkPath = Test-Path $filename
if ($checkPath) {
    #=> File exist true! proceed further
    #Write-Host "File length is: "(Get-Item $filename).Length
    if ((Get-Item $filename).Length -gt 0kb) {
        #=> File is not empty! proceed further
        foreach ($line in [System.IO.File]::ReadLines($filename)) {
            #=> Reading data from the file.
            [string]$data = $line	
        }
        $i = 0
        $final = 0
        Do {
            #Write-Host ""
            #Write-Host "loop i value is:" $i
            #Write-Host "data at $i is:" $data[$i]
            #Write-Host "data at $i-1 is:" $data[$i -1]
            #Write-Host ""
            if ($data[$i] -eq $data[$i -1]) {
                $final += [int]$data.substring($i,1)
            }
            $i++    
        } While ($i -le $data.Length-1)
        
        #=>Solution to your sequence
        Write-Host "Solution to your sequence: "$final
    }
    else {
        #=> File empty! Exit
        Write-Host "File does not contain data!"
    }
}
else {
    #=> File not present! Exit
    Write-Host "Sorry, Path/File not found!"
}