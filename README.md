# backupdirs_wsl
This is a bash script that will backup a folder based off of a source drive and folder name that you provide as arguments to the script. This file is zipped up and placed in location based off of the target drive and folder name that you provide as arguments to the script. Unzipping on the target destination is optional. 
**Designed to work on exclusively on WSL (Windows subsystem for Linux).** 

Useful for backing up data in one drive to another (say on external) and good idea to run this on a cron
_Note: So long as the folder names passed in are unique to that drive, the folder will automatically found and be backed up. Folder names must also not contain any whitespaces_

## Arguments 
1. Source Drive Letter (case-insensitive). Example 'g'
2. Source Folder name (Exact case). Example 'My_Dir_to_backup'. No white spaces and must be unique to source drive!
3. Target Drive letter (case-insensitive). Example 'e'
4. Target Folder name (Exact case). Example 'Backedup_dirs'. No white spaces and must be unique to target drive! Defaults to root if not specified
5. [Optional] Whether to keep as zip (default) or extract. Example: extract
6. [Optional] Create an alias. Just pass in a name

# Full Example: 
Abstract: `bash backupdir_zip.sh [target drive] [target folder] [source drive] [source folder] [extract] [alias name]`

Concrete: `bash backupdir_zip.sh g dirtibackup e backupsdir extract backupnow`

### On Alias
If an alias is passed in, this backup process will be saved as an alias saved in the ~/.bashrc file.
With this in place, one can run the exact same backup again at a later time by simply enerting the alias name they provided in the command line.

_Note: This does require that one must first log/out after this script is run - or manually source their .bashrc file for these changes to take effect._

## Preconfig Notes
1. It's important to note that the drives you are referencing must be mounted. 
* If you are referencing an external drive for example, this may not mount by default in the Linux file structure. All drives are mounted on the /mnt/ dir followed by their latter name. Example: '/mnt/c'. So if you don't have your drive mounted it's easy enough to mount it. 
* Suppose your external drive letter is 'G'. Simply create a dir on the /mnt/ dir that corresponds to this letter.
* * `sudo mkdir /mnt/g`
* Then, mount your drive onto this dir
* * `G: /mnt/g drvfs defaults 0 0 `
2. If you are considering running this as a cronjob to automatically run backups on a set schedule, make sure the cron service is running
* You can chek the status of the cron service with
* * `sudo service cron status`
* And you can start the service with
* * `sudo service cron start`  
