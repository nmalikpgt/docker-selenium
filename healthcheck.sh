echo 'Checking if hub is ready with a time limit of 200 seconds'
count=0
while true; do
  count=$((count+1))
  echo "Attempt: ${count}"

  # Fetch status and trim whitespace
  ready=$(curl -s http://10.10.10.215:4444/wd/hub/status | jq -r .value.ready | tr -d '[:space:]')

  if [ "$ready" = "true" ]; then
      echo "Selenium grid is up and running. Now Running Tests...."
      # Start the java command
      java -cp 'libs/*' org.testng.TestNG testng.xml
      exit 0
  elif [ "$count" -ge 200 ]; then
      echo "**** HUB IS NOT READY WITHIN 200 SECONDS ****"
      exit 1
  fi
  sleep 5  # Sleep for 5 seconds before next attempt
done