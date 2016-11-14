# Wordpress Installer
WordPress Installer BASH Script

You can install WordPress in any directory for any user at less than a minute. Just, run follows commands...

*This commands will download WordPress Installer BASH Script to your server.*
```sh
curl -O https://raw.githubusercontent.com/gurkanbicer/Wordpress-Installer/master/wpInstall.sh
mv wpInstall.sh /usr/bin/wpInstall
chmod a+x /usr/bin/wpInstall
```

*.. and this command will run WordPress Installer BASH Script.*
```sh
wpInstall
```

**Sample output:**
```sh
WordPress Installation
***
User:
sampleuser
Directory: (such as /www)
/www
Database name:
sample_db
Database user:
sample_user
Database password:
samplepassword!!
Run install? (yes/no)
yes
Bash script is installing the WordPress right now.
***
... 
bla bla bla 
...
Do you install prepared themes and plugins? (yes/no)
no
Prepared themes and plugins will not install.
Cleaning...
Installation is complete.
```

The best property of this script, it also install  prepared themes and plugins during WordPress installation.

Prepared themes and plugins directory path:

**/root/wpInstallExt**

*/root/wpInstallExt/themes*

*/root/wpInstallExt/plugins*

**Attention!** Prepared themes and plugins should be uncompressed. 
