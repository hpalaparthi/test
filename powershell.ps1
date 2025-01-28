# Define the target directory
$TargetDir = "C:\Path\To\Your\Folder"

# Define the output CSV file
$OutputFile = "C:\Path\To\Your\FileCountLog.csv"

# Get the current timestamp
$CurrentTime = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

# Count the number of files in the directory
$FileCount = (Get-ChildItem -Path $TargetDir -File -Recurse | Measure-Object).Count

# Check if the output file exists; if not, create it with a header
if (!(Test-Path $OutputFile)) {
    "Timestamp,File Count" | Out-File -FilePath $OutputFile -Encoding UTF8
}

# Append the timestamp and file count to the CSV file
"$CurrentTime,$FileCount" | Out-File -FilePath $OutputFile -Append -Encoding UTF8

Write-Output "File count logged successfully to $OutputFile."
