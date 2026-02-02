Hospital Data Monitoring & Archival System

Overview
This project is a Linux shell scripting system that monitors simulated hospital device logs, allows interactive log archiving, and generates basic analysis reports using command-line tools.

Main Files
archive_logs.sh — Archive selected logs with timestamp
analyze_logs.sh — Analyze logs and create reports
heart_rate_monitor.py — Heart monitor simulator
temperature_recorder.py — Temperature simulator
water_consumption.py — Water usage simulator
reports/analysis_report.txt — Analysis results

How to Run
Start simulators (separate terminals):
python3 heart_rate_monitor.py start
python3 temperature_recorder.py start
python3 water_consumption.py start

Check logs:
tail -f hospital_data/active_logs/heart_rate.log

Run scripts:
chmod +x archive_logs.sh analyze_logs.sh
./archive_logs.sh
./analyze_logs.sh

Skills Demonstrated
Shell scripting with menus
Log archiving & rotation
CLI data analysis (awk, grep, sort, uniq)
Report generation



