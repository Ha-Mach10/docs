# reference: https://qiita.com/letian/items/a7bd3a46365797625813
# reference: https://www.python.org/downloads/
# This script installs Python 3.13.5 on a Windows machine using PowerShell.
# このスクリプトは、PowerShellを使用してWindowsマシンにPython 3.13.5をインストールします。

# Define the URL of the Python installer
# PythonインストーラのURLを定義
$InstallerFile = "python-3.13.5-amd64.exe"
$InstallerUrl = "https://www.python.org/ftp/python/3.13.5/$InstallerFile"

# Define the path where you want to save the installer
# インストーラを保存するパスを定義
$InstallerPath = Join-Path $env:TEMP $InstallerFile

# Download the installer
# インストーラをダウンロード
$ProgressPreference = 'SilentlyContinue'
Invoke-WebRequest -Uri $InstallerUrl -OutFile $InstallerPath

# Unblock the installer
# インストーラのブロックを解除
Unblock-File -Patj $InstallerPath

# Execute the installer silently
# インストーラをサイレントモードで実行
Start-Process -Wait -FilePath $InstallerPath -Args "/quiet PrependPath=1"

# Clrean up the installer agter installation (optional)
# インストール後にインストーラをクリーンアップ（オプション）
Remove-Item -Path $InstallerPath