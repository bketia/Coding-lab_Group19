# Hospital Data Monitoring System

This is a shell-based system for managing hospital device logs with archival and analysis features.

## Quick Start
1. **Setup:**
```bash
mkdir -p hospital_data/{active_logs,archived_logs,reports}
mkdir -p hospital_data/archived_logs/{heart_data_archive,temperature_archive,water_archive}
chmod +x archive_logs.sh analyze_logs.sh
```

2. **Run simulators** (in separate terminals):
``` bash
python3 simulators/heart_monitor.py start
python3 simulators/temp_sensor.py start
python3 simulators/water_meter.py start
```
3. **Use scripts:**
```bash
./archive_logs.sh    # Archive logs
./analyze_logs.sh    # Analyze logs
```

## Scripts
* **archive_logs.sh:** Archives logs with timestamp (heart_rate.log → heart_rate_2024-01-01_12:00:00.log)

* **analyze_logs.sh:** Analyzes logs and adds reports to hospital_data/reports/analysis_report.txt

## Directory Structure
```
hospital_data/
├── active_logs/           # Current logs
├── archived_logs/         # Archived logs by type
└── reports/               # Analysis reports
```

## Requirements
* Bash shell
* Python 3 (for simulators)
* Linux tools: awk, grep, sort, uniq, date