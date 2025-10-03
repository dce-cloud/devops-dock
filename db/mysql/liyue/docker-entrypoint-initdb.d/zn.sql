CREATE DATABASE IF NOT EXISTS `newenglish_develop` CHARACTER SET = 'utf8mb4' COLLATE = 'utf8mb4_unicode_ci';
CREATE DATABASE IF NOT EXISTS `legion_develop` CHARACTER SET = 'utf8mb4' COLLATE = 'utf8mb4_unicode_ci';
GRANT ALL ON `newenglish_develop`.* TO 'develop'@'%' ;
GRANT ALL ON `legion_develop`.* TO 'develop'@'%' ;

FLUSH PRIVILEGES ;