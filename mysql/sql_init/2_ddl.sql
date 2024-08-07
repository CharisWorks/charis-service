CREATE USER 'exporter'@'%' IDENTIFIED BY 'jees1oovahW7Zi9eop0w' WITH MAX_USER_CONNECTIONS 3;
GRANT PROCESS, REPLICATION CLIENT ON *.* TO 'exporter'@'%';
GRANT SELECT ON performance_schema.* TO 'exporter'@'%';