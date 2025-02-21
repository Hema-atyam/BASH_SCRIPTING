#!/bin/bash

# Configuration
LOG_FILE="/var/log/syslog"      # Path to the syslog file
ERROR_PATTERN="ERROR"          # Pattern to search for in the syslog
EMAIL_SUBJECT="Error Pattern Found"
EMAIL_TO="godavariammai8@gmail.com"  # Email recipient
EMAIL_FROM="sender@gmail.com"  # Email sender (may need to configure)

# Check if the log file exists
if [[ ! -f "$LOG_FILE" ]]; then
    echo "Log file does not exist: $LOG_FILE"
    exit 1
fi

# Search for the error pattern in the log file using sudo for permission
ERRORS=$(sudo grep "$ERROR_PATTERN" "$LOG_FILE")

# Check if any errors were found
if [[ -z "$ERRORS" ]]; then
    EMAIL_BODY="No error pattern '$ERROR_PATTERN' found in the log file '$LOG_FILE'."
else
    # If errors are found, include only the matching lines in the email body
    EMAIL_BODY="The following error pattern '$ERROR_PATTERN' was found in the log file '$LOG_FILE':\n\n$ERRORS"
fi

# Send the email with only the error logs or message
echo -e "$EMAIL_BODY" | msmtp --from="$EMAIL_FROM" "$EMAIL_TO"

# Optional: Output a message confirming email sent or not
if [[ -z "$ERRORS" ]]; then
    echo "No errors found. No email sent."
else
    echo "Email sent to $EMAIL_TO regarding the error pattern."
fi
