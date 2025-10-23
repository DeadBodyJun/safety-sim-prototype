# start_server.ps1
# 로컬 웹서버 자동 실행 스크립트

try { Get-ExecutionPolicy -Scope CurrentUser | Out-Null } catch { Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force }

# http-server 없으면 설치
$hasServer = (Get-Command http-server -ErrorAction SilentlyContinue) -ne $null
if (-not $hasServer) {
  Write-Host "Installing http-server globally..."
  npm install -g http-server
}

# 현재 폴더로 이동
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $scriptDir

# 포트 지정
$port = 8080
Start-Process "http://localhost:$port"
http-server . -p $port
