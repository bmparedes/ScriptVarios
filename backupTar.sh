cd /var/www/html

FILE1=nomber.`date +"%Y%m%d"`

tar -czvf [direccionbackup]/tar/${FILE1}.tar.gz  [direcion archivo]/

find [direcionbk] -mtime +30 -exec rm {} \; 