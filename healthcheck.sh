echo "Checking if hub is ready and time limit is 60 seconds"
count=0
while [ "$( curl -s http://10.10.10.215:4444/wd/hub/status | jq -r .value.ready )" != "true" ]
do
  count=$((count+1))
  echo "Attempt: ${count}"
  if [ "$count" -ge 60 ]
  then
    echo "**** HUB IS NOT READY SECONDS ****"
    exit 1
    fi
	sleep 1
done
# start the java commands
java -cp 'libs/*' org.testng.TestNG testng.xml