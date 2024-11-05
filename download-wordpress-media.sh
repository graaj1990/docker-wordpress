#!/bin/bash

# Script to download WordPress media files from a Docker container

# Configuration
WP_CONTAINER="wordpress"             # Name of the WordPress container
MEDIA_PATH="/var/www/html/wp-content/uploads"  # Path to WordPress media folder in the container
BACKUP_PATH="./wordpress-media-backup"  # Path on the local machine where media files will be copied
DATE=$(date +"%Y%m%d_%H%M%S")         # Timestamp for the backup directory

# Create backup directory if it doesn't exist
mkdir -p $BACKUP_PATH/$DATE

# Copy WordPress media files from the Docker container
docker cp $WP_CONTAINER:$MEDIA_PATH $BACKUP_PATH/$DATE

# Check if the media files were successfully copied
if [ $? -eq 0 ]; then
    echo "WordPress media files successfully downloaded to: $BACKUP_PATH/$DATE"
else
    echo "Failed to download WordPress media files!"
fi
