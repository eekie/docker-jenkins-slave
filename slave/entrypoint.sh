 echo "JENKINS_URL"
 while true; do
     curl ${JENKINS_URL} 2>/dev/null && break
     sleep 1
 done

echo "Starting slave,  connecting to jenkins:50000"

exec bash -c "curl http://jenkins:8080/jnlpJars/slave.jar -o /slave.jar && java -jar slave.jar -jnlpUrl http://jenkins:8080/computer/jenkins-slave/slave-agent.jnlp"
