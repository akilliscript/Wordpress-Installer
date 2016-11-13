#!/bin/bash
clear
echo "WordPress Installation"
echo "***"
echo "User:"
read user
userpath="/home/$user"
if [ ! -d "$userpath" ]; then
echo "User doesn't exists."
exit
else
echo "Directory: (such as /www)"
read wwwpath
if [ ! -d "$userpath$wwwpath" ]; then
echo "Directory doesn't exists."
exit
else
cd $userpath$wwwpath
echo "Database name:"
read dbname
echo "Database user:"
read dbuser
echo "Database password:"
read dbpass
echo "Run install? (yes/no)"
read run
if [ "$run" = "yes" ]; then
echo "Bash script is installing the WordPress right now."
echo "***"
curl -O https://wordpress.org/latest.tar.gz
tar -zxvf latest.tar.gz
cd wordpress
cp -rf . ..
cd ..
rm -rf wordpress
cp wp-config-sample.php wp-config.php
perl -pi -e "s/database_name_here/$dbname/g" wp-config.php
perl -pi -e "s/username_here/$dbuser/g" wp-config.php
perl -pi -e "s/password_here/$dbpass/g" wp-config.php
perl -i -pe'
  BEGIN {
    @chars = ("a" .. "z", "A" .. "Z", 0 .. 9);
    push @chars, split //, "!@#$%^&*()-_ []{}<>~`+=,.;:/?|";
    sub salt { join "", map $chars[ rand @chars ], 1 .. 64 }
  }
  s/put your unique phrase here/salt()/ge
' wp-config.php
mkdir wp-content/uploads
echo "Do you install prepared themes and plugins? (yes/no)"
read prepared
if [ "$prepared" = no ]; then
echo "Prepared themes and plugins will not install."
else
wpinstallextpath="/root/wpInstallExt"
if [ ! -d "$wpinstallextpath" ]; then
echo "Prepared themes and plugins doesn't exists."
else
cp -r $wpinstallextpath/* wp-content/
fi
fi
echo "Cleaning..."
rm latest.tar.gz
chown -R $user:$user *
echo "Installation is complete."
else
exit
fi
fi
fi
