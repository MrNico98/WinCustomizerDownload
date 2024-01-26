if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Output "WinCustomizer necessita di essere lanciato come Amministratore. Riavvio."
    Start-Process -Verb runas -FilePath powershell.exe -ArgumentList "irm -Uri https://bit.ly/3SgTLYU | iex"
    break
}

Remove-Item -Path "$env:USERPROFILE\Desktop\WinCustomizerDownload" -Recurse -Force | out-null
if (Test-Path -Path "$env:USERPROFILE\Desktop"-PathType Leaf) {Remove-Item -Path "$env:USERPROFILE\OneDrive\Desktop\WinCustomizerDownload" -Recurse -Force}

# Change to the desktop directory
cd "$env:USERPROFILE\Desktop"
if (Test-Path -Path "$env:USERPROFILE\Desktop"-PathType Leaf) {cd "$env:USERPROFILE\OneDrive\Desktop"}

# Download the script from GitHub
Invoke-WebRequest -Uri "https://codeload.github.com/MrNico98/WinCustomizerDownload/zip/refs/heads/main" -OutFile "WinCustomizerDownload-main.zip"


Expand-Archive -Path "WinCustomizerDownload-main.zip" -DestinationPath "." -Force


Move-Item -Path "WinCustomizerDownload-main" -Destination "WinCustomizerDownload" -Force


Remove-Item -Path "WinCustomizerDownload-main.zip" -Recurse -Force


Start-Process -FilePath ".\WinCustomizerDownload\DownloadWinCustomizer.bat"
