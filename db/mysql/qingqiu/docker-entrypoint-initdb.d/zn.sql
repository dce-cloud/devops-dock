CREATE DATABASE IF NOT EXISTS `newenglish_test` CHARACTER SET = 'utf8mb4' COLLATE = 'utf8mb4_unicode_ci';
CREATE DATABASE IF NOT EXISTS `legion_test` CHARACTER SET = 'utf8mb4' COLLATE = 'utf8mb4_unicode_ci';
GRANT ALL ON `newenglish_test`.* TO 'develop'@'%' ;
GRANT ALL ON `legion_test`.* TO 'develop'@'%' ;

FLUSH PRIVILEGES ;