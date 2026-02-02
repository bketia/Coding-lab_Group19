#!/bin/bash

# Archive Logs Script
# This script archives selected log files with timestamp and creates new empty log files

# Display  menu
echo "Select log to archive:"
echo "1) Heart Rate"
echo "2) Temperature"
echo "3) Water Usage"

# Get user selection
read -p "Enter choice (1-3): " choice

# Determine file paths based on user selection
case $choice in
    1)
        log_file="hospital_data/active_logs/heart_rate.log"
        archive_dir="hospital_data/archived_logs/heart_data_archive"
        log_name="heart_rate"
        ;;
    2)
        log_file="hospital_data/active_logs/temperature.log"
        archive_dir="hospital_data/archived_logs/temperature_data_archive"
        log_name="temperature"
        ;;
    3)
        log_file="hospital_data/active_logs/water_usage.log"
        archive_dir="hospital_data/archived_logs/water_usage_data_archive"
        log_name="water_usage"
        ;;
    *)
        echo ""
        echo "Error: Invalid input. Please enter 1, 2, or 3."
        exit 1
        ;;
esac

# Validate log file exists
if [ ! -f "$log_file" ]; then
    echo "Error: Log file '$log_file' not found"
    exit 1
fi

# Ensure archive directory exists
mkdir -p "$archive_dir"

# Generate timestamp for archived filename
timestamp=$(date +"%Y-%m-%d_%H-%M-%S")

# Construct archived file path
archived_file="${archive_dir}/${log_name}_${timestamp}.log"

# Archive the log file
echo ""
echo "Archiving ${log_name}.log..."
mv "$log_file" "$archived_file"

# Create new empty log file for continued monitoring
touch "$log_file"

# Confirm successful archival
echo "Successfully archived to ${archived_file}"
echo "New empty log file created: ${log_file}"
