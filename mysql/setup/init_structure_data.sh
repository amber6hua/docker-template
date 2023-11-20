echo "init mysql..."
chown -R mysql:mysql /var/lib/mysql
mysql -uroot -p123456 < ./sql/mysql.sql

