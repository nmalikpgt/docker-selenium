echo "Checking if hub is ready and time limit is 200 seconds"
while [ "$( curl -s http://10.10.10.215:4444/wd/hub/status | jq -r .value.ready )" != "true" ]
do
	sleep 1
done
echo "Selenium grid is up and running. Now Running Tests...."

# start the java command
java -cp 'libs/*' org.testng.TestNG testng.xml
