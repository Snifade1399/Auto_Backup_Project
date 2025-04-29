#!/bin/bash

echo -n "Enter the source directory for backup: "
read source_dir

echo -n "Enter the destination to store backup: "
read dest_dir

# Get date and time
date_stamp=$(date +%Y-%m-%d)
time_stamp=$(date +%H-%M-%S)

# Build full path
backup_path="$dest_dir/Backup_${date_stamp}/${time_stamp}.tar.gz"

# 🔧 Create the parent directory first
mkdir -p "$(dirname "$backup_path")"

echo "[INFO] Backing up $source_dir to $backup_path"

# 🗃️ Run the backup
if tar -czf "$backup_path" "$source_dir" 2>/dev/null; then
    echo "[SUCCESS] Backup completed at $backup_path"
else
    echo "[ERROR] Backup failed at $backup_path"
fi

