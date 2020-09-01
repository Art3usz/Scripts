################
# KONFIGURACJA #
################

wallpaper_url="http://www.v-maxautoszkola.pl/img/egzamin.jpg"
# Hasło: egzamin
passwd="\$6\$wPwzvkXH\$YjFy4QTaJiVzVI0bwjY87rjawxfx5HG82xBKiONdnbzT9uBmT782MJ9/aOhB4EwWjYotLctkKjfcAQb9QVVw91" 

################
#    SKRYPT    #
################

if [ "$USER" != "root" ];
then
  echo "Proszę uruchomić skrypt jako root."
  exit
fi

username=$1

if [ -z "$username" ];
then
  echo "Proszę podać nazwę użytkownika."
  echo "./remove-user.sh <nazwa-uzytkownika>"
  exit
fi

echo "Tworzenie konta: $username"
useradd --sh /bin/bash --create-home --password $passwd $username

wget -O /home/$username/wallpaper.jpg $wallpaper_url
chown $username:$username /home/$username/wallpaper.jpg

echo "
dbus-send --session --dest=org.kde.plasmashell --type=method_call /PlasmaShell org.kde.PlasmaShell.evaluateScript 'string:
var Desktops = desktops();                                                                                                                       
for (i=0;i<Desktops.length;i++) {
        d = Desktops[i];
        d.wallpaperPlugin = \"org.kde.image\";
        d.currentConfigGroup = Array(\"Wallpaper\",
                                    \"org.kde.image\",
                                    \"General\");
        d.writeConfig(\"Image\", \"file:///home/$username/wallpaper.jpg\");
}'" >> /home/$username/.bashrc
#chmod o+x /tmp/wall.sh

mkdir /home/$username/.config
#mkdir /home/$username/.config/autostart-scripts
#ln -s /tmp/wall.sh /home/$username/.config/autostart-scripts/wall.sh

mkdir /home/$username/.config/autostart
echo "[Desktop Entry]
Comment[pl_PL]=
Comment=
Exec=/usr/bin/konsole
GenericName[pl_PL]=
GenericName=
Icon=system-run
MimeType=
Name[pl_PL]=
Name=
Path=
StartupNotify=true
Terminal=false
TerminalOptions=
Type=Application
X-DBUS-ServiceName=
X-DBUS-StartupType=
X-KDE-SubstituteUID=false
X-KDE-Username=
" > /home/$username/.config/autostart/konsole.desktop

chown -R $username:$username /home/$username/.config