<#
Problem Given:
A spreadsheet (file task2). For each row, determine the difference between the largest value and the smallest value; the checksum is the sum of all of these differences.
For example, given the following spreadsheet:
5 1 9 5
7 5 3
2 4 6 8
The first rows largest and smallest values are 9 and 1, and their difference is 8. The second rows largest and smallest values are 7 and 3, and their difference is 4. The third row's difference is 6. In this example, the spreadsheet's checksum would be 8 + 4 + 6 = 18.
To Do:
What is the checksum for your spreadsheet? (using PowerShell)
#>
<#
Explanation of my Logic:
Step 1: After taking the filename(with path) as an input and reading the data from the file, sort the data.
Step 2: Once the data is sorted extract the first and the last value (First = Smallest & Last = Largest)
Step 3: Take a difference of these Last and First values per line and assign it to an array.
Step 4: Sum up the array to get the checksum of the spreadsheet.

Note: Uncomment the write-hosts when need to debug.
#>
Write-Host "Welcome to the Checksum match program!"
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
            #Write-host "Working on line--"$line
            [int[]]$data = ($line).split()| Where-Object {$_}
            #=> Sorting data:
            [array]::sort($data)
            #Write-host "First Value: "$data[0]
            #Write-host "Last Value: "$data[-1]
            #=> Getting difference:
            [int[]]$diff = $data[-1] - $data[0]
            #Write-host "Difference is-->" $diff
            #=> Assigning difference to an array
            [int[]]$final += $diff
        
        }
        #=> Sum up the array value to get the fianl result.
        Write-host "Checksum of the spreadsheet: "($final | Measure-Object -Sum).sum

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