$Pins = @{}

function Get-GpioPin {
    [Cmdletbinding()]
    param (
        [Parameter(Mandatory)]
        [int]$Number
    )
    $ErrorActionPreference = 'Stop'
    Set-StrictMode -Version 2

    if ($Pins.ContainsKey($Number)) {
        $Pins[$Number]
    }
    else {
        $Pins.Add($Number, $Gpio.OpenPin($Number)) | Out-Null
        $Pins[$Number]
    }
}