#
# Converter for Image-Files in same folder as PowerShellScript 
# to generate a javascript Output File, which can be included in HTML Pages
# Author: Envalee
# Created: 07.02.2022
# Updated: 19.04.2022
#



#
# Config

# Path in which all base64 data will be stored
[String]$script:ConfigOutputJavaScriptFilePath = "./JavaScriptImages.js"
# Allowed File-Extensions, which will be converted
$script:ConfigAllowedExtensions = @("png","jpg","jpeg","bmp","ico") # << Add more here if needed
# Detailed Output ( log )
[bool]$script:ConfigVerbose = $false # Set to true on a lot of files if you want to feel like a hacker :P

#
# Globals

# To see result count
[int]$script:FileCounterOk = 0
[int]$script:FileCounterTotal = 0
# Logging
[System.Collections.Generic.List[String]]$script:ErrorLog = [System.Collections.Generic.List[String]]::new()

#
# The Main Method where everything starts...
# ( is called at the end of this Script, to have access to all declared methods below )
function Main {

    # Start
    Write-Host "Start converting all images in current folder..." -ForegroundColor Cyan

    try {

        # Clear Output File to Replace content
        if(Test-Path $script:ConfigOutputJavaScriptFilePath){
            Write-Host "Clear Output file..." -ForegroundColor Cyan
            Clear-Content $script:ConfigOutputJavaScriptFilePath
            Write-Host "Output file clear successfull" -ForegroundColor Green
        }

        Write-Host "Iterate items in current folder..." -ForegroundColor Cyan

        # Iterate all Items in current Folder and append Data to output file
        Get-ChildItem -Path "./" | Foreach-Object {

            $fileExtension = $_.Extension.Replace(".","")
            $fileName = $_.BaseName

            # Sum Up Total Files
            $script:FileCounterTotal += 1

            # Convert the Image-Bytes to data String | if fail it returns ""
            $base64Code = (Convert -path $_.Name)

            # Check if Convert was okay
            if($base64Code -eq ""){
                return # Continue / Break here
            }
            
            # Verbose Output / Detailed
            if($script:ConfigVerbose -eq $true){
                Write-Host "Write Data to output file - $fileExtension - $fileName" -ForegroundColor Green
            }

            # Append Output to File
            Write-Output "var Image$($fileName) = '$($base64Code)';" >> $script:ConfigOutputJavaScriptFilePath
          
            # Sum up Ok Files
            $script:FileCounterOk += 1

        }

    } catch { Write-Host "Unhandled Error: $($_)" -ForegroundColor Red }

    # Output Errors
    Write-Host "--------------------------------------------------"
    Write-Host "Not converted files:"
    $script:ErrorLog | ForEach-Object { Write-Host $_ -ForegroundColor Red }

    # Done
    Write-Host "--------------------------------------------------"
    Write-Host "Converter finished! Converted files: $script:FileCounterOk/$script:FileCounterTotal" -ForegroundColor Green
    Write-Host "--------------------------------------------------"

}

#
# Convert a given image file (by $path) to a uri base64 data string
# Example:
# -> Input: "C:\MyFolder\MyImage.png" 
# -> Output: "data:image/png;base64,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"
# Will return emtpy string on error
function Convert {
    
    Param([String]$path)

    # Check Param
    if( ! (Test-InputPath -path $path) ){
        return "";
    }

    # Process data if valid
    [String[]]$pathParts = $path.split(".")
    [String]$fileExtension = $pathParts[$pathParts.Count -1]
    [String]$uri = "data:image/$($fileExtension);base64,"

    # Convert to Base64 uri String
    [String]$base64 = [convert]::ToBase64String((Get-Content $path -encoding byte))

    return ($uri + $base64)
    
}

#
# Will check, if a given path parameter is valid for this converter actions
# Output Boolean ($true or $false)
function Test-InputPath {

    Param([String]$path)

    # Checks
    [bool]$isInputEmpty = ($path -eq "")
    [bool]$isNotExistingInputFile = ($false -eq (Test-Path $path))

    # Ignore File if not a Image
    if($false -eq $script:ConfigAllowedExtensions.Contains($fileExtension) ){
        $msg = "Ignore (Extension not allowed) - $fileExtension - on $fileName"

        # Verbose Output / Detailed
        if($script:ConfigVerbose -eq $true){
           Write-Host $msg -ForegroundColor Red
        }

        $script:ErrorLog.Add($msg)
        return $false        
    }

    # Emtpy Input path -> return ""
    if($isInputEmpty) {
        $msg = "Input path is not valid (empty)"

        # Verbose Output / Detailed
        if($script:ConfigVerbose -eq $true){
           Write-Host $msg -ForegroundColor Red
        }

        $script:ErrorLog.Add($msg)
        return $false
    }

    # Input File not exists -> return ""
    if($isNotExistingInputFile) {
        $msg = "Unable to find file: $path"

        # Verbose Output / Detailed
        if($script:ConfigVerbose -eq $true){
           Write-Host $msg -ForegroundColor Red
        }

        $script:ErrorLog.Add($msg)
        return $false
    }

    return $true

}

# Call Main Function, to start Script
Main
