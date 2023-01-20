winget install -e --id Git.Git;
winget install -e --id Oracle.JavaRuntimeEnvironment;
winget install -e --id Oracle.JDK.19;
winget install -e --id Microsoft.DotNet.SDK.7;

winget install -e --id Microsoft.VisualStudioCode;
winget install -e --id Microsoft.WindowsTerminal;
winget install -e --id Microsoft.PowerShell;
winget install -e --id Notepad++.Notepad++;
winget install -e --id Obsidian.Obsidian;

winget install -e --id Lexikos.AutoHotkey;
winget install -e --id Microsoft.PowerToys;
winget install -e --id OBSProject.OBSStudio;
winget install -e --id ShareX.ShareX;

winget install -e --id Brave.Brave;
winget install -e --id Discord.Discord;
winget install -e --id Spotify.Spotify;

Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
irm get.scoop.sh | iex

scoop install oh-my-posh fzf psfzf curl jq sudo dark gcc make
scoop install Iosevka-NF JetBrainsMono-NF FantasqueSansMono-NF Hack-NF Cascadia-Code
