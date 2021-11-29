# backupdirs_wsl
This is a bash script that will backup a folder based off of a source drive and folder name that you provide as arguments to the script. This file is zipped up and placed in location based off of the target drive and folder name that you provide as arguments to the script. Unzipping on the target destination is optional. Designed to work on WSL (Windows subsystem for Linux). 

Useful for backing up data in one drive to another (say on external) and good idea to run this on a cron
_Note: So long as the folder names passed in are unique to that drive, the folder will automatically found and be backed up. Folder names must also not contain any whitespaces_

## Arguments 
1.Source Drive Letter (case-insensitive). Example 'g'
2. Source Folder name (Exact case). Example 'My_Dir_to_backup'. No white spaces and must be unique to source drive!
3. Target Drive letter (case-insensitive). Example 'e'
4. Target Folder name (Exact case). Example 'Backedup_dirs'. No white spaces and must be unique to target drive! Defaults to root if not specified
5. [Optional] Whether to keep as zip (default) or extract. Example: extract
6. [Optional] Create an alias. Just pass in a name

# Full Example: 
Abstract: `backupdir_zip.sh [target drive] [target folder] [source drive] [source folder] [extract] [alias name]`
Concrete: `backupdir_zip.sh g dirtibackup e backupsdir extract backupnow

### On Alias
If an alias is passed in, this backup process will be saved as an alias saved in the ~/.bashrc file.
With this in place, one can run the exact same backup again at a later time by simply enerting the alias name they provided in the command line.

_Note: This does require that one first log/out after this script is run - or manually source their .bashrc file
make sure to source ~/.bashrc
