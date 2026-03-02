# WiFi Password Recovery Tool

A simple and effective Windows Batch script (`wifi.bat`) that extracts and displays all saved WiFi network profiles and their corresponding passwords on your local machine. It uses built-in Windows utilities to retrieve the information safely and saves the results into a convenient text file.

## Features

- **Automated Extraction:** Automatically retrieves all saved WiFi profiles and their clear-text passwords using the `netsh` utility.
- **Admin Privilege Check:** Ensures the script is running with the required Administrator privileges before executing.
- **Console Output:** Neatly formats and displays the recovered SSIDs and passwords directly in the command prompt.
- **Log File Generation:** Saves the complete list of recovered credentials to a timestamped text file (e.g., `WiFi_Passwords_YYYYMMDD_HHMMSS.txt`) in the same directory for easy reference.
- **User-friendly Prompts:** Prompts the user to instantly open the compiled results file upon completion.

## Requirements

- **Operating System:** Windows (Windows 7, 8, 10, 11).
- **Privileges:** **Administrator** access is required to read the underlying clear-text WiFi passwords from the system.

## Usage

1. **Locate the Script:** Find the `wifi.bat` script on your local machine.
2. **Run as Administrator:** 
   - Right-click the `wifi.bat` file.
   - Select **"Run as administrator"**.
   - If prompted by User Account Control (UAC), click **Yes**.
3. **View Results:** The script will scan your system and print the saved network profiles along with their passwords within the console window.
4. **Access the Output File:** A text file containing the results securely named `WiFi_Passwords_[Timestamp].txt` will be automatically generated in the same directory as the script.
5. **Review Log:** At the end of the execution, the script will ask if you want to open the results file. Press `Y` to open the file immediately, or `N` to close it.

## Troubleshooting

- **"This script requires Administrator privileges"**: The script requires elevated permissions to view the protected details of WiFi profiles. Make sure to right-click the script and execute it via "Run as administrator".
- **[No password saved/Open network]**: If the network is public (open) without a password or if the security key couldn't be fetched, the tool correctly reports that no password was saved.

## Disclaimer

This script is created for **personal use and recovery purposes only** to help you retrieve forgotten WiFi passwords for networks you rightfully own or connect to. Please use responsibly and do not utilize it on computers or networks you do not have permission to access.
