#!/bin/bash

# (1)  set up all the mysqldump variable
cd directoriobackup
FILE1=nombre.sql.`date +"%Y%m%d"`
DBSERVER1=host database
DATABASE1=name database
USER1=name user db
PASS1=password db

# (2) do the mysql database backup (dump)

# use this command for a database server on localhost
#mysqldump --opt --user=${USER1} --password=${PASS1} ${DATABASE1} > ${FILE1}

# use this command for a databases server on remote 
#mysqldump --opt --host=${DBSERVER1} --user=${USER1} --password=${PASS1} ${DATABASE1} > ${FILE1}

# (3) compress the mysql databases dump file
tar -cvzf ${FILE1}.tar.gz ${FILE1}
rm ${FILE1}

echo "Backup successfully completed the `date`" >> /opt/log_backupdb.txt

$ Delete files older that 30 days
 find bkdirectory -mtime +30 -exec rm {} \;
