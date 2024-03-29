###
### Copy createdb.sql.example to createdb.sql
### then uncomment then set database name and username to create you need databases
#
# example: .env MYSQL_USER=appuser and need db name is myshop_db
#
#    CREATE DATABASE IF NOT EXISTS `myshop_db` ;
#    GRANT ALL ON `myshop_db`.* TO 'appuser'@'%' ;
#
###
### this sql script is auto run when mariadb container start and $DATA_PATH_HOST/mariadb not exists.
###
### if your $DATA_PATH_HOST/mariadb is exists and you do not want to delete it, you can run by manual execution:
###
###     docker-compose exec mariadb bash
###     mysql -u root -p < /docker-entrypoint-initdb.d/createdb.sql
###

CREATE DATABASE IF NOT EXISTS `googlesheet` COLLATE 'utf8_general_ci' ;
GRANT ALL ON `googlesheet`.* TO 'default'@'%' ;

FLUSH PRIVILEGES ;
