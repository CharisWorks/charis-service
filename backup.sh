#!/bin/sh

# Function to perform backup
backup() {
    TIMESTAMP=$(date +'%Y%m%d%H%M%S')
    FILENAME="/backups/${DATABASE_NAME}_${TIMESTAMP}.sql"
    echo "Starting backup: ${FILENAME}"
    mysqldump -h ${DATABASE_HOST} -u ${DATABASE_USER} -p${DATABASE_PASS} ${DATABASE_NAME} > ${FILENAME}
    echo "Backup completed: ${FILENAME}"
}

# Initial backup
backup

# Schedule backups every hour
while true; do
    sleep 3600
    backup
done