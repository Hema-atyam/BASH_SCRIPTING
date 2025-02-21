#!/bin/bash

##########################################
#sending email if found any errors in logs
##########################################

LOG_FILE="/var/log/syslog"              # Log file path
EMAIL_PATTERN="ERROR"                 # Patter to search in log file
EMAIL_SUBJECT="ERROR found"
EMAIL_TO="godavariammai8@gmail.com"   # Email recipient
EMAIL_FROM="sender@example.com"       # Email sender
SMTP_SERVER="smtp.gmail.com"        # SMTP server for sending emails

if [[ ! -f "$LOG_FILE" ]]; then
        echo "log file does not exists"
        exit 1
fi

ERRORS=$(grep "$ERROR_PATTERN" "$LOG_FILE")

if [[ -z "$ERRORS" ]]; then
        echo "No "$ERROR_PATTERN" found in the log"

else
        EMAIL_BODY="The following error pattern '$ERROR_PATTERN' was found in the log file '$LOG_FILE':\n\n$ERRORS"
        echo -e "$EMAIL_BODY" | msmtp --from="$EMAIL_FROM" "$EMAIL_TO"

        echo "Email sent to "$EMAIL_TO" regarding errors"
fi
