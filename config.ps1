Install-Module -Name oh-my-posh
Install-Module -Name posh-git
Install-Module -Name z
Install-Module -Name PSF
Install-Module -Name Terminal-Icons

.\appinstall.ps1

mv .\vscode\settings.json $VSCODE_CONFIGURATION 
mv .\terminal\settings.json $TERMINAL_CONFIGURATION 

mkdir $CONFIG
mkdir $POWERSHELL
mv .\powershell\user_profile.ps1 $POWERSHELL
mv .\powershell\themes $POWERSHELL
mv .\powershell\Powershell $USER/Documents

unzip .\derby.zip db-derby-10.14.2.0-bin
mv .\netbeans\db-derby-10.14.2.0-bin $NETBEANS_FILE

# Netbeans fonts
cp C:\Users\Herfost\AppData\Local\Microsoft\Windows\Fonts\*.ttf C:\Windows\Fonts

# Netbeans config: Settings > Configuration > Import > config.zip
# Netbeans plugins: Settings > Plugins > Installed > *.nbm