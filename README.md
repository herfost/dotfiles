# Windows 10 Config Files 

## Filesystem
`~`
```ps1
d----        12/02/2023     17:14                  .aws
d----        12/02/2023     17:14                ﴃ  .azure
d----        12/02/2023     06:22                  .config
d----        12/02/2023     17:17                  .docker
d----        12/02/2023     03:30                  .dotnet
d----        12/02/2023     04:34                  .nbi
d----        12/02/2023     03:25                  .vscode
d----        14/02/2023     21:00                  Archive
d-r--        16/02/2023     18:23                ﲾ  Desktop
d----        15/02/2023     10:42                  Development
d-r--        12/02/2023     10:35                  Documents
d-r--        13/02/2023     18:30                  Downloads
d----        12/02/2023     07:33                  Home
d-r--        12/02/2023     02:53                  Links
d-r--        12/02/2023     02:53                  Music
d-r--        11/02/2023     22:57                  Pictures
d----        12/02/2023     03:32                  scoop
d-r--        12/02/2023     03:18                  Videos
-a---        16/02/2023     18:23            456   .cdHistory
-a---        14/02/2023     21:11             44   .gitconfig
-a---        12/02/2023     22:37              4   .node_repl_history
```

- [`.config`](config/): contiene i file di configurazione
- [`Archive`]() contienre i file meno utilizzati e archiviati
- [`Home`]() contienre i file di utilizzo quotidiano
- [`Development`]() contienre i file di sviluppo software, studio e approfondimenti personali
- [`*`]() i restanti folder e file sono default / dipendenze di sistema
![](assets/Screenshot%20(1).png)
![](assets/Screenshot%20(2).png)

---
## Applications Installation Script:
```ps1
winget install -e --id Git.Git;
winget install -e --id Microsoft.DotNet.SDK.7;
winget install -e --id Oracle.JavaRuntimeEnvironment;
winget install -e --id Oracle.JDK.19;

winget install -e --id Microsoft.VisualStudioCode;
winget install -e --id Microsoft.WindowsTerminal;
winget install -e --id Microsoft.PowerShell;
winget install -e --id Notepad++.Notepad++;
winget install -e --id Obsidian.Obsidian;

winget install -e --id Docker.DockerDesktop
winget install -e --id OpenJS.NodeJS
winget install -e --id Python.Python.3.9

winget install -e --id Microsoft.PowerToys;
winget install -e --id OBSProject.OBSStudio;
winget install -e --id ShareX.ShareX;

winget install -e --id Brave.Brave;
winget install -e --id Discord.Discord;
winget install -e --id Spotify.Spotify;

# Scoop Package Manager
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
irm get.scoop.sh | iex

# Terminal Applications & Extensions
scoop install oh-my-posh fzf curl jq sudo dark gcc make tar gpg neovim

# Fonts
scoop install Iosevka-NF JetBrainsMono-NF FantasqueSansMono-NF Hack-NF Cascadia-Code
```

---
## Powershell Configuration
![](assets/Screenshot%20(4).png)

- [`Documents` >  `Powershell` > `Microsoft.PowerShell_profile.ps1`](PowerShell/Microsoft.PowerShell_profile.ps1):

```ps1
# Variabili
$USER = $env:USERPROFILE
$CONFIG = "$USER\.config"
$POWERSHELL = "$CONFIG\powershell"
$CURRENTPROFILE = "$POWERSHELL\user_profile.ps1"
$VAULTS = "$USER\Documenti\Vaults"

# Profilo
. $CURRENTPROFILE
```

- Specificare il percorso del prifilo con la variabile $CURRENTPROFILE

- [`.config` > `powershell` > `user_profile.ps1`](config/powershell/user_profile.ps1):
```ps1
# Posh
Import-Module posh-git

# Icone
Import-Module Terminal-Icons

# Auto Completition
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle List
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

# Fuzzy Finder
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

oh-my-posh get shell

# Alias
Set-Alias alias Set-Alias
Set-Alias s scoop
Set-Alias v nvim
Set-Alias c code
Set-Alias g git
Set-Alias n node
Set-Alias x explorer
Set-Alias ll ls
Set-Alias l ls
Set-Alias touch New-Item
Set-Alias unzip Expand-Archive
Set-Alias grep findstr
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'

# Utilities
function cl { cat $args | less }
function which { Get-Command -Name $args -ErrorAction SilentlyContinue | Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue }

# Symbolic Links
function filelink { cmd /c mklink $args[0] $args[1] }
function dirlink { cmd /c mklink /d $args[0] $args[1] }

# Themes
$ThemesPath = "$POWERSHELL\themes\"
$Themes = Get-ChildItem $ThemesPath -Name
$ThemeName = 'capr4n.omp.json'
$ThemePath = -join($ThemesPath,  $ThemeName)

function Theme { $ThemePath = -join($ThemesPath, $args[0]); oh-my-posh init pwsh --config $ThemePath | Invoke-Expression }
Theme $ThemeName

function lamp-start {
    docker start lamp-redis
    docker start lamp-mysql8
    docker start lamp-phpmyadmin
    docker start lamp-php8
}

function lamp-stop {
    docker stop lamp-redis
    docker stop lamp-mysql8
    docker stop lamp-phpmyadmin
    docker stop lamp-php8
}

clear
```

---
## VSCode
![](assets/Screenshot%20(5).png)
![](assets/Screenshot%20(6).png)
- Importare la configurazione: `Manage` > `Profile` > `Import` > [`VSCode/profiles/joebiden.code-profile`](VSCode/profiles/joebiden.code-profile)

---
## Netbeans
![](assets/Screenshot%20(10).png)
![](assets/Screenshot%20(11).png)
- Installare [JDK 8](config/netbeans/jdk-8u202-windows-x64.exe)
- Installare [Netbeans](config/netbeans/netbeans-8.2-windows.exe)

- Importare la configurazione: `Tools` > `Options` > `Import` >[`config/netbeans/configuration.zip`](config/netbeans/configuration.zip)

- Importare tema: `Tools` > `Plugins` > `Installed` > [`config/netbeans/darcula/darcula.nbm`](config/netbeans/darcula/darcula.nbm)

---
## Obsidian
![](assets/Screenshot%20(7).png)
![](assets/Screenshot%20(9).png)
- Copiare Vault [Template_v1](Obsidian/Templates/Template_v1/)