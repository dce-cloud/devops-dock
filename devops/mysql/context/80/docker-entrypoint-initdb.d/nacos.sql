CREATE USER 'nacos'@'%' IDENTIFIED BY 'wxrx+f~C]x6!@7Y4+Me+';
GRANT ALL ON *.* TO 'nacos'@'%';

FLUSH PRIVILEGES;

CREATE DATABASE IF NOT EXISTS `nacos` CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci'; ;
