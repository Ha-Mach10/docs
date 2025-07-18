# これはnvm(Node Version Manager)のインストール用パッチファイルである。

$InstallerFile = "nvm-setup.exe"
$InstallerUrl = "https://github.com//coreybutler/nvm-windows/releases/download/1.2.2/$InstallerFile"

# ローカルに一時ファイルの生成。
New-TemporaryFile
$InstallerPath = Join-Path $env:TEMP $InstallerFile

# 進捗状態の不活性化。
$ProgressPreference = 'SilentlyContinue'
# WEBリクエストの実行。
Invoke-WebRequest -Uri $InstallerUrl -OutFile $InstallerPath

# ダウンロードファイルのブロックを解除.
Unblock-File -Path $InstallerPath

# インストーラを実行.
Start-Process -Wait -FilePath $InstallerPath -ArgumentList "/silent", "/qn"

# ファイルを除去.
Remove-Item -Path $InstallerPath