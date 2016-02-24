function Set-GpioPinValue {
    [Cmdletbinding()]
    param (
        [Parameter(Mandatory, Position=0)]
        [int]$Number,

        [Parameter(Mandatory, Position=1)]
        [ValidateSet(0,1)]
        [int]$Value
    )
    $ErrorActionPreference = 'Stop'
    Set-StrictMode -Version 2

    $pin = Get-GpioPin -Number $Number

    $pin.Write($Value)
}