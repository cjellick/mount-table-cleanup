### Instance mount cleanup
This script removes rows from the `mount` table that point to instances in the purged state and to volumes that are for local host bind mounts or anonymous docker volumes.

After this script is ran, the TableCleanup task must run in Rancher for the rows in the instance table to be removed. This task runs every hour but can be configured to run more frequently by setting the `task.table.cleanup.schedule` setting. You can set it in the API UI by opening a browser to `<rancher_url>/v2-beta/settings/task.table.cleanup.schedule`. The setting is in seconds, so setting it to 60 will cause the task to run every minute.

This logic will be added to the rancher code base and ran automatically with the rest of Rancher's cleanup logic, but this script can be used to address an immediate need to reduce the number of rows in the instance table.


### Usage
1. Set appropriate environment variables in `env_vars` file and source it: `. env_vars`
2. Run the script: `./fix.sh`

