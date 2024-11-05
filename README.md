# docker-wordpress
Run the following command to start the containers:

docker-compose up -d

# Open a web browser and go to:

http://localhost:8080

# Stopping and Removing Containers

docker-compose down


# To create a backup of your database, simply run:

./backup-database.sh


# To create a script that downloads the media files from a WordPress site running in a Docker container, you will need to:

Access the WordPress container.

Copy the media files from the /var/www/html/wp-content/uploads directory (where WordPress stores media files) to your local machine.

This script will use docker cp to copy the files from the container to a designated folder on your local machine.

# Make the script executable by running:

chmod +x download-wordpress-media.sh

# Run the Script:

./download-wordpress-media.sh

The media files will be saved in the wordpress-media-backup directory on your local machine, inside a timestamped folder (e.g., wordpress-media-backup/20241105_120000).
