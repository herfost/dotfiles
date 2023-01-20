# Variabili
$NETBEANS_FILES = "C:\Program Files\NetBeans 8.2"
$NETBEANS_CONFIGURATION = "$env:APPDATA\Netbeans\8.2"
$TERMINAL_CONFIGURATION = "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState"
$VSCODE_CONFIGURATION = "$env:APPDATA\Code\User"

$USER = $env:USERPROFILE
$CONFIG = "$USER\.config"
$POWERSHELL = "$CONFIG\powershell"
$CURRENTPROFILE = "$POWERSHELL\user_profile.ps1"
$VAULTS = "$USER\Documenti\Vaults"

# Profilo
. $CURRENTPROFILE