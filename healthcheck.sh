#!/bin/bash

echo 'Checking if hub is ready and time limit is 200 seconds'
count=0
max_attempts=200  # Maximum number of attempts
hub_url="http://10.10.10.215:4444/wd/hub/status"

while [ "$(curl -s "$hub_url" | jq -r '.value.ready')" != "true" ]; do
    ((count++))
    echo "Attempt: $count"
    if [ "$count" -ge "$max_attempts" ]; then
        echo "**** HUB IS NOT READY WITHIN 200 SECONDS ****"
        exit 1
    fi
    sleep 1
done

echo "Selenium grid is up and running. Now Running Tests...."
# Start the java command
java -cp 'libs/*' org.testng.TestNG testng.xml