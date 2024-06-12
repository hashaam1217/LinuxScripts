# Automatic Git Commit and Push Script

This shell script automates the process of committing and pushing changes to a Git repository. It's designed to be used with Neovim (nvim) configurations, but you can adapt it for other projects as well.

## Usage

1. **Prerequisites**:
   - Ensure you have Git installed on your system.
   - Replace `~/.config/nvim` with the actual path to your Neovim configuration directory.

2. **Script Explanation**:
   - The script does the following:
     - Changes the working directory to `~/.config/nvim`.
     - Captures the current date and time.
     - Adds all changes (`git add .`).
     - Commits with a timestamped message (`git commit -m "Automatic commit on $current_time"`).
     - Pushes the changes to the `main` branch (`git push origin main`).

3. **Set Up Cron Job**:
   - To run this script automatically, create a cron job (type "crontab -e").
   - Adjust the schedule according to your needs.

4. **Customization**:
   - Modify the script to fit your specific use case.
   - You can change the branch name (`main` in this example) or customize the commit message.

## Notes

- Remember to make the script executable using `chmod +x script_name.sh`.
- Replace placeholders (`~/.config/nvim`, etc.) with your actual paths.

Feel free to adapt and enhance this script based on your requirements! 🚀📅🕒

