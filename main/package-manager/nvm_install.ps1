# �����nvm(Node Version Manager)�̃C���X�g�[���p�p�b�`�t�@�C���ł���B

$InstallerFile = "nvm-setup.exe"
$InstallerUrl = "https://github.com//coreybutler/nvm-windows/releases/download/1.2.2/$InstallerFile"

# ���[�J���Ɉꎞ�t�@�C���̐����B
New-TemporaryFile
$InstallerPath = Join-Path $env:TEMP $InstallerFile

# �i����Ԃ̕s�������B
$ProgressPreference = 'SilentlyContinue'
# WEB���N�G�X�g�̎��s�B
Invoke-WebRequest -Uri $InstallerUrl -OutFile $InstallerPath

# �_�E�����[�h�t�@�C���̃u���b�N������.
Unblock-File -Path $InstallerPath

# �C���X�g�[�������s.
Start-Process -Wait -FilePath $InstallerPath -ArgumentList "/silent", "/qn"

# �t�@�C��������.
Remove-Item -Path $InstallerPath