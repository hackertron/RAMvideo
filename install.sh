echo "begin install "

sudo apt-get install php7.0 apache2 mariadb-server php-curl imagemagick  php-imagick ffmpeg php7.0-mysqli php7.0-xml ruby --yes

sudo gem install flvtool2

apt-get install gpac mediainfo

# after install

# Creating directory et get sources
mkdir -p /home/http/clipbucket/ && cd "$_"
git clone https://github.com/hackertron/RAMvideo.git ./

phpenmod imagick

echo extension=imagick.so >> /etc/php/7.0/apache2/php.ini

