#!/bin/bash

# Auto backup by snifade



# Asks the user for the backup dir

read -p "Enter the source directory for backup: " SOURCE_DIR

read -p "Enter the destinationn to store backup: " DEST_DIR


# Timestamp

TIMESTAMP=$(date +"%Y-%m-%D-%H-%M-%S")

BACKUP_FILE="Backup_${TIMESTAMP}.tar.gz"


# Logs

LOG_FILE="$DEST_DIR/backup_log.txt"


# Create Backup

echo "[INFO] Backing up $SOURCE_DIR to $DEST_DIR/$BACKUP_FILE"

tar -czf "$DEST_DIR/$BACKUP_FILE" "$SOURCE_DIR" 2>> "$LOG_FILE"

# Check if successful

if [ $? -eq 0 ]; then
	echo "[SUCCESS] Backup completed at $TIMESTAMP" | tee -a "$LOG_FILE"
else 
	echo "[ERROR] Backup failed at $TIMESTAMP" | tee -a "$LOG_FILE"
fi

