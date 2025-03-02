@echo off
setlocal enabledelayedexpansion

REM Check if a file is passed as an argument
if "%~1"=="" (
    echo Please drag and drop a CSV file onto this batch file.
    pause
    exit /b
)

REM Get the input file (dragged file)
set input_file=%~1

REM Check if the file exists
if not exist "%input_file%" (
    echo File "%input_file%" does not exist.
    pause
    exit /b
)

REM Get the output file name (same as input but with .txt extension)
set output_file=%~dpn1.txt

REM Remove the previous output file if it exists (no blank line)
if exist "%output_file%" del "%output_file%"

REM Loop through each line of the CSV
for /f "tokens=1,2 delims=," %%A in (%input_file%) do (
    REM Combine Exchange and Ticker into formatted output
    echo %%A:%%B >> "%output_file%"
)

REM Inform user the output file is ready
echo Formatted tickers saved to "%output_file%"

pause
