#!/bin/bash

# Interactive Log Analysis Script

echo "Select log file to analyze:"
echo "1) Heart Rate (heart_rate.log)"
echo "2) Temperature (temperature.log)"
echo "3) Water Usage (water_usage.log)"
read -p "Enter choice (1-3): " choice

case $choice in
    1)
        log_file="hospital_data/active_logs/heart_rate_log.log"
        type="Heart Rate"
        ;;
    2)
        log_file="hospital_data/active_logs/temperature_log.log"
        type="Temperature"
        ;;
    3)
        log_file="hospital_data/active_logs/water_usage_log.log"
        type="Water Usage"
        ;;
    *)
        echo "Error: Invalid input."
        exit 1
        ;;
esac

if [ ! -f "$log_file" ]; then
    echo "Error: File $log_file does not exist."
    exit 1
fi

report_file="hospital_data/reports/analysis_report.txt"
mkdir -p "$(dirname "$report_file")"

echo "Analyzing $type Data..."

# Append header to report
{
    echo "========================================"
    echo "Log Analysis Report: $type"
    echo "Date: $(date)"
    echo "Source File: $log_file"
    echo "----------------------------------------"
    echo "Device Statistics:"
} >> "$report_file"

# Count occurrences per device
awk '{print $3}' "$log_file" | sort | uniq -c >> "$report_file"

# Get timestamps (Bonus)
start_time=$(head -n 1 "$log_file" | awk '{print $1, $2}')
end_time=$(tail -n 1 "$log_file" | awk '{print $1, $2}')

{
    echo "----------------------------------------"
    echo "Recording Period: From $start_time to $end_time"
    echo "========================================"
    echo "" 
} >> "$report_file"

echo "Analysis complete. Results appended to $report_file"
