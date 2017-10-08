echo "begin install "

sudo apt-get install php7.0 git  apache2 mariadb-server php-curl imagemagick  php-imagick ffmpeg php7.0-mysqli php7.0-xml ruby --yes

sudo gem install flvtool2

apt-get install gpac mediainfo

# after install


sudo phpenmod imagick

echo extension=imagick.so >> /etc/php/7.0/apache2/php.ini

sed -i '809s/.*/upload_max_filesize = 500M/' /etc/php/7.0/apache2/php.ini

sed -i '656s/.*/post_max_size = 100M/' /etc/php/7.0/apache2/php.ini

sed -i '389s/.*/memory_limit = 128M/' /etc/php/7.0/apache2/php.ini

sed -i '368s/.*/max_execution_time = 7200/' /etc/php/7.0/apache2/php.ini

sed -i '389s/.*/memory_limit = 128M/' /etc/php/7.0/apache2/php.ini

echo magic_quotes_gpc = on >> /etc/php/7.0/apache2/php.ini
echo magic_quotes_runtime = offloc >> /etc/php/7.0/apache2/php.ini

echo "restarting apache server now ..."
sudo service apache2 restart

# get source from git 
git clone  https://github.com/hackertron/RAMvideo.git
