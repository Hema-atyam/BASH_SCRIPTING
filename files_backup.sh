#!/bin/bash

SOURCE_DIR="/path/to/source"
BACKUP_DIR="/path/to/backup"
BACKUP_FILE="$BACKUP_DIR/backup_$(date +%Y%m%d_%H%M%S).tar.gz"

mkdir -p "$BACKUP_DIR"

tar -czf "$BACKUP_FILE" -C "$SOURCE_DIR" .

echo "Backup created at: $BACKUP_FILE"
