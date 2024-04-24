echo "Checking if hub is ready"

while [ "$( curl -s http://10.10.10.215:4444/wd/hub/status | jq -r .value.ready )" != "true" ]
do
	sleep 1
done
# start the java command
java -cp selenium-docker.jar:selenium-docker-tests.jar:libs/* org.testng.TestNG Test.xml