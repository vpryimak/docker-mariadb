#!/bin/bash

__start_mysql() {
echo "mysql setup and start"
mysql_install_db
chown -R mysql:mysql /var/lib/mysql
/usr/bin/mysqld_safe & 
sleep 5
}

__create_user_mysql() {
echo "Creating mysql user."
mysqladmin -u root password qwerty
mysql -uroot -pqwerty -e "CREATE DATABASE IF NOT EXISTS DAP;"
mysql -uroot -pqwerty -e "GRANT ALL PRIVILEGES ON DAP.* TO 'dap'@'%' IDENTIFIED BY 'dap'; FLUSH PRIVILEGES;"
killall  mysqld
}

# Call functions
__start_mysql
__create_user_mysql
