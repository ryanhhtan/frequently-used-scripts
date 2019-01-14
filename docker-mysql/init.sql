ALTER USER 'root'@'localhost' IDENTIFIED BY 'mysql123QWEASD'; 
CREATE USER 'mysql'@'%' IDENTIFIED BY 'example';
GRANT ALL PRIVILEGES ON *.* TO 'mysql'@'%';
