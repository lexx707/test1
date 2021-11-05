#!/bin/bash
DOWN_DIR=/home/lexx707/Загрузки
LASTEST=$(curl --silent "https://github.com/iteufel/nwjs-ffmpeg-prebuilt/releases/latest" | egrep -o 'https://github.com/iteufel/nwjs-ffmpeg-prebuilt/releases/tag/[0-9]*.[0-100]*.*' | sed 's/".*//')
PREFIX=${LASTEST:61}
ARCH_NAME=$PREFIX-linux-x64.zip
LINK=https://github.com/iteufel/nwjs-ffmpeg-prebuilt/releases/download/$PREFIX/$ARCH_NAME

sudo apt-get update
sudo apt-get upgrade
sudo apt-get autoremove
sudo apt-get autoclean

echo "Проверить обновления ядер и системы? Введите 1 - нет или 2 - Да "
read varname

 if [[ "$varname" == "1" ]]; then
echo "Обновление приложений завершено, обновление системы и ядер производится не будет"
elif [[ "$varname" == "2" ]]; then
sudo apt-get dist-upgrade
else
echo "вы ввели хуету, введите число 1 или 2"
fi 

echo -e "\n\033[7m$ update ffmpeg codecs for opera"
wget -P $DOWN_DIR $LINK
unzip $DOWN_DIR/$ARCH_NAME
sudo mv libffmpeg.so /usr/lib/x86_64-linux-gnu/opera/
rm $DOWN_DIR/$ARCH_NAME
