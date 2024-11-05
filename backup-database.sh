#!/bin/bash

# Script to backup MySQL database from Docker container

# Configuration
DB_CONTAINER="wordpress_db"        # Name of the MySQL container
DB_USER="wordpress"                # MySQL username
DB_PASSWORD="wordpresspassword"    # MySQL password
DB_NAME="wordpress"                # Database name
BACKUP_PATH="./backup"             # Backup directory on the host
DATE=$(date +"%Y%m%d_%H%M%S")      # Timestamp for the backup file

# Create backup directory if it doesn't exist
mkdir -p $BACKUP_PATH

# Dump the MySQL database from the Docker container
docker exec $DB_CONTAINER /usr/bin/mysqldump -u$DB_USER -p$DB_PASSWORD $DB_NAME > $BACKUP_PATH/$DB_NAME-backup-$DATE.sql

# Check if the backup was successful
if [ $? -eq 0 ]; then
    echo "Database backup successful: $BACKUP_PATH/$DB_NAME-backup-$DATE.sql"
else
    echo "Database backup failed!"
fi
