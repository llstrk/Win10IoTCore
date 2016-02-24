function Set-GpioPinDriveMode {
    [Cmdletbinding()]
    param (
        [Parameter(Mandatory, Position=0)]
        [int]$Number,

        [Parameter(Mandatory, Position=1)]
        [ValidateSet('Input','InputPullDown','InputPullUp','Output','OutputOpenDrain','OutputOpenDrainPullup','OutputOpenSource','OutputOpenSourcePullDown')]
        [string]$DriveMode
    )
    $ErrorActionPreference = 'Stop'
    Set-StrictMode -Version 2

    $pin = Get-GpioPin -Number $Number

    $driveModes = @{
        Input                    = 0
        InputPullDown            = 3
        InputPullUp              = 2
        Output                   = 1
        OutputOpenDrain          = 4
        OutputOpenDrainPullUp    = 5
        OutputOpenSource         = 6
        OutputOpenSourcePullDown = 7

    }

    $pin.SetDriveMode($driveModes[$DriveMode])
}