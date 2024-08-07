#!/bin/sh

# Function to perform backup
backup() {
    TIMESTAMP=$(date +'%Y%m%d%H%M%S')
    FILENAME="/backups/${DATABASE_NAME}_${TIMESTAMP}.sql"
    echo "Starting backup: ${FILENAME}"
    mysqldump -q -h ${DATABASE_HOST} -u ${DATABASE_USER} -p${DATABASE_PASS} ${DATABASE_NAME} > ${FILENAME}
    echo "Backup completed: ${FILENAME}"
}

# Function to remove old backups from the same day
remove_old_backups() {
    # Get the current date in YYYYMMDD format
    CURRENT_DATE=$(date +'%Y%m%d')
    
    # Get the list of backup files for the current day
    BACKUP_FILES=$(ls /backups/${DATABASE_NAME}_${CURRENT_DATE}*.sql | sort)
    
    # Keep only the latest backup file
    KEEP_FILE=$(echo "$BACKUP_FILES" | tail -n 1)
    
    # Remove all other backup files from the current day
    for file in $BACKUP_FILES
    do
        if [ "$file" != "$KEEP_FILE" ]; then
            echo "Removing old backup: $file"
            rm "$file"
        fi
    done
}

# Initial backup
backup

# Schedule backups every hour and remove old backups
while true; do
    sleep 3600
    backup
    remove_old_backups
done