#!/bin/bash

SOURCE_DIR="$HOME/devops-practice/data"
BACKUP_DIR="$HOME/devops-practice/backups"
LOG_FILE="$HOME/devops-practice/log.txt"
DATE=$(date +%Y-%m-%d_%H-%M-%S)
BACKUP_NAME="backup_$DATE.tar.gz"

mkdir -p "$BACKUP_DIR"

tar -czf "$BACKUP_DIR/$BACKUP_NAME" "$SOURCE_DIR"

echo "[$(date)] Created backup: $BACKUP_NAME" >> "$LOG_FILE"

# מחיקת גיבויים בני יותר מ-7 ימים
find "$BACKUP_DIR" -name "*.tar.gz" -type f -mtime +7 -exec rm {} \;
echo "[$(date)] Old backups older than 7 days removed." >> "$LOG_FILE"

echo "✅ גיבוי הושלם ונשמר בתיקייה: $BACKUP_DIR"
