# stop_server.ps1
# http-server 프로세스 종료용

Get-Process | Where-Object { $_.ProcessName -match "node" } | ForEach-Object {
  $cmdline = (Get-CimInstance Win32_Process -Filter "ProcessId=$($_.Id)").CommandLine
  if ($cmdline -match "http-server") {
    Write-Host "Stopping server PID $($_.Id)"
    Stop-Process -Id $_.Id -Force
  }
}
