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

echo "Wyłączanie wszystkich procesów użytkownika $username"
killall -u $username

echo "Usuwanie konta $username"
deluser --remove-all-files $username
echo "Zakończone"
