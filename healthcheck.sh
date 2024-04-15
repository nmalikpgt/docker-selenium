echo "Checking if hub is ready"

count=0
while [ "$( curl -s http://10.10.10.215:4444/wd/hub/status | jq -r .value.ready )" != "true" ]
do
  count=$((count+1))
  echo "Attempt: ${count}"
  if [ "$count" -ge 30 ]
  then
    echo "**** HIB IS NOT READY WITHIN 30 SECONDS ****"
    exit 1
    fi
	sleep 1
done
echo "Selenium grid is up and running. Now Running Tests...."

# start the java command
java -cp 'libs/*' org.testng.TestNG testng.xml

