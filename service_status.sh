#!/bin/bash

# List of services to check
SERVICES=("nginx" "apache2" "mysql" "ssh")

# Loop through each service in the list
for SERVICE in "${SERVICES[@]}"
do
    # Check if the service is active (running)
    if systemctl is-active --quiet $SERVICE; then
        echo "$SERVICE is running."
    else
        echo "$SERVICE is NOT running."
    fi
done
