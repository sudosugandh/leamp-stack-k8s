#!/bin/bash

##################################################

export PATH=/bin:/usr/bin:/usr/local/bin
TODAY=$(date +"%d%b%Y")
DAY_OF_WEEK=$(date +%u) # 1-7 (Monday-Sunday)
DAY_OF_MONTH=$(date +%d) # 01-31

################################################################
################## Update below values  ########################

DB_BACKUP_PATH='/backup/dbbackup'
MYSQL_HOST='localhost'
MYSQL_PORT='3306'
MYSQL_USER='root'
MYSQL_PASSWORD='mysecret'
DATABASE_NAME='mydb'
DAILY_RETAIN_DAYS=30
WEEKLY_RETAIN_WEEKS=12
MONTHLY_RETAIN_MONTHS=12

#################################################################

# Function to create backup
create_backup() {
    local backup_type=$1
    local backup_path="${DB_BACKUP_PATH}/${backup_type}/${TODAY}"
    
    mkdir -p ${backup_path}
    echo "Backup started for database - ${DATABASE_NAME}"

    mysqldump -h ${MYSQL_HOST} -P ${MYSQL_PORT} -u ${MYSQL_USER} -p${MYSQL_PASSWORD} ${DATABASE_NAME} | gzip > ${backup_path}/${DATABASE_NAME}-${TODAY}.sql.gz

    if [ $? -eq 0 ]; then
        echo "${backup_type^} backup successfully completed"
    else
        echo "Error during ${backup_type} backup"
        exit 1
    fi
}

# Function to clean up old backups
cleanup_backups() {
    local backup_type=$1
    local retain_count=$2

    find ${DB_BACKUP_PATH}/${backup_type}/ -type d -mtime +${retain_count} -exec rm -rf {} \;
}

# Daily backup
create_backup "daily"
cleanup_backups "daily" ${DAILY_RETAIN_DAYS}

# Weekly backup on Sunday (day 7)
if [ ${DAY_OF_WEEK} -eq 7 ]; then
    create_backup "weekly"
    cleanup_backups "weekly" $((WEEKLY_RETAIN_WEEKS * 7))
fi

# Monthly backup on the 1st day of the month
if [ ${DAY_OF_MONTH} -eq 01 ]; then
    create_backup "monthly"
    cleanup_backups "monthly" $((MONTHLY_RETAIN_MONTHS * 30))
fi

### End of script ####



If you want to perform an action every day and use the date divided by 7 as a part of your logic without using a conditional check, you can incorporate the remainder directly into your commands. Here’s an example script:

```bash
#!/bin/bash

TODAY=$(date +"%d%b%Y")
DAY_OF_WEEK=$(date +%u) # 1-7 (Monday-Sunday)
DAY_OF_MONTH=$(date +%d) # 01-31

################################################################
################## Update below values  ########################

DB_BACKUP_PATH='/backup/dbbackup'
MYSQL_HOST='localhost'
MYSQL_PORT='3306'
MYSQL_USER='root'
MYSQL_PASSWORD='mysecret'

# Calculate the remainder when day of the month is divided by 7
REMAINDER=$(($DAY_OF_MONTH % 7))

# Perform backup and include the remainder in the filename or directory name
BACKUP_FILE="${DB_BACKUP_PATH}/backup_${TODAY}_rem${REMAINDER}.sql"

echo "Backing up database to ${BACKUP_FILE}..."

# Replace the following line with your actual backup command
# For example, using mysqldump:
mysqldump -h $MYSQL_HOST -P $MYSQL_PORT -u $MYSQL_USER -p$MYSQL_PASSWORD --all-databases > $BACKUP_FILE

echo "Backup completed!"
```

In this script, the `REMAINDER` variable is used to create a unique backup filename based on the day of the month divided by 7. The script performs the backup every day, and the backup file name will include the remainder value, ensuring a different file name each week.




If you want to perform an action every day and use the date divided by 7 as a part of your logic without using a conditional check, you can incorporate the remainder directly into your commands. Here’s an example script:

```bash
#!/bin/bash

TODAY=$(date +"%d%b%Y")
DAY_OF_WEEK=$(date +%u) # 1-7 (Monday-Sunday)
DAY_OF_MONTH=$(date +%d) # 01-31

################################################################
################## Update below values  ########################

DB_BACKUP_PATH='/backup/dbbackup'
MYSQL_HOST='localhost'
MYSQL_PORT='3306'
MYSQL_USER='root'
MYSQL_PASSWORD='mysecret'

# Calculate the remainder when day of the month is divided by 7
REMAINDER=$(($DAY_OF_MONTH % 7))

# Perform backup and include the remainder in the filename or directory name
BACKUP_FILE="${DB_BACKUP_PATH}/backup_${TODAY}_rem${REMAINDER}.sql"

echo "Backing up database to ${BACKUP_FILE}..."

# Replace the following line with your actual backup command
# For example, using mysqldump:
mysqldump -h $MYSQL_HOST -P $MYSQL_PORT -u $MYSQL_USER -p$MYSQL_PASSWORD --all-databases > $BACKUP_FILE

echo "Backup completed!"
```

In this script, the `REMAINDER` variable is used to create a unique backup filename based on the day of the month divided by 7. The script performs the backup every day, and the backup file name will include the remainder value, ensuring a different file name each week.





