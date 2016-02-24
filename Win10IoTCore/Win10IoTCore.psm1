$Gpio = [Win10IoTCore.Gpio]::GetGpioController()

# Dynamically load all ps1 files.
$files = Get-ChildItem -Path $PSScriptRoot -Filter '*.ps1' -Recurse

foreach ($file in $files) {
    Write-Verbose "Loading '$($file.Name)'."
    . $file.FullName
}