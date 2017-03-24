A playground for jenkins, docker, slaves, jenkins pipeline etc..

A docker compose file to start jenkins with a slave with maven and docker available. You 
can use the slave to build doker images for example.

the first time you run `docker-compose up -d` you might want to check the logs for the
generated admin password. use `docker-compose logs`

The first time the slave will stop because it can't connect to the master (still starting)
just re-run `docker-compose up -d` after the jenkins master is starten. Then the slave will
be able to connect.

The first time you login you will need to install/update some standard plugins.

* manage jenkins >> manage nodes >> create node

* enter node name "jenkins-slave"

* select "permanent agent" (the only option available)

* in the node details add label "docker"

* for the rest use defaults (like execution mode == java webstart)

Only when you configured your jenkins master with the "jenkins-slave". The docker slave container will be able to connect.

With recent jenkins images, security is enabled by default, and the slave will not be able to connect since it is using this commmand: (see docker-compose.yml)

`command: bash -c "curl http://jenkins:8080/jnlpJars/slave.jar -o /slave.jar && java -jar slave.jar -jnlpUrl http://jenkins:8080/computer/jenkins-slave/slave-agent.jnlp"`

To allow the slave to connect you can either disable security in jenkins: manage jenkins >> configure global security >> uncheck activate security 

or you can try adding login credential in de jnlp command mentioned above like this: `-auth user:password`
but I didn't tested this yet.
