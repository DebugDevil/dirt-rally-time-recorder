@echo OFF
sqlite3.exe -init export-laptimes.sql dirtrally-laptimes.db .exit
echo Exported to snapshot.csv
pause