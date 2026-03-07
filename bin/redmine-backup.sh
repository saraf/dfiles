#!/bin/bash
#================================================================
# BACK UP REDMINE DATABASE AND FILES TO DigitalOcean VOLUME
# mounted on /mnt/volume_blr1_01
# Password for root user is present in .my.cnf as follows


#		[client]
#		user=root
#		password='xxxxxxxxxxxxxx'

#		[mysqldump]
#		user=root
#		password='xxxxxxxxxxxxxx'

#BACKUP_DIR has already been created 
#	- /mnt/volume_blr1_01/redmine-backup
#================================================================


TIMESTAMP=`date +%Y-%m-%d-%H:%M:%S`
BACKUP_DIR=/mnt/volume_blr1_01/redmine-backup
#mkdir $BACKUP_DIR
#/usr/bin/mysqldump -u root redminetrack | gzip > /mnt/volume_blr1_01/redmine-backup/redmine_db_`date +%Y-%m-%d-%H:%M:%S`.gz
/usr/bin/mysqldump -u root redminetrack | gzip > $BACKUP_DIR/redmine_db_`date +%Y-%m-%d-%H:%M:%S`.gz
rsync -a /srv/redmine $BACKUP_DIR/srv-redmine-folder
rsync -a /etc/apache2 $BACKUP_DIR/apache2-config/
rsync -a /etc/init.d/redmine $BACKUP_DIR/etc-initdotd-redmine
#cd /srv
#tar cvjf $BACKUP_DIR/redmine-folder-snapshot-$TIMESTAMP.tar.bz2 redmine/
