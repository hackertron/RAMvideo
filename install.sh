echo "begin install "

sudo apt-get update

sudo apt-get dist-upgrade -f

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

a2enmod rewrite

sudo service apache2 restart

#copy contents now 
echo "copying source"
cp -r RAMvideo/upload/* /var/www/html/
cp RAMvideo/upload/.htaccess /var/www/html/

#fix permissions 
sudo chmod -R 777 /var/www/html/includes/
sudo chmod -R 777 /var/www/html/files/
sudo chmod -R 777 /var/www/html/images/
sudo chmod -R 777 /var/www/html/cache/
sudo chmod -R 777 /var/www/html/cb_install/


# change owner 

chown www-data:www-data -R /var/www/html/

## set up cron jobs 

crontab -l | { cat; echo "* * * * * php -q /var/www/html/actions/video_convert.php"; } | crontab -

crontab -l | { cat; echo "* * * * * php -q /var/www/html/actions/verify_converted_videos.php"; } | crontab -

crontab -l | { cat; echo "0 0,12,13 * * * php -q /var/www/html/actions/update_cb_stats.php"; } | crontab -

crontab -l | { cat; echo "* * * * * php -q /var/www/html/youtube_upload.php"; } | crontab -


# add install 

mkdir /var/www/html/files/temp
touch /var/www/html/files/temp/install.me

#change files folder permissions

sudo chmod -R 777 /var/www/html/files/temp/

echo "RAMvideo installed successfully" 

echo "go to http://localhost/cb_install to finish up your install"

## nee to generate tokens !!
