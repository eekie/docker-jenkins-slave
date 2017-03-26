A playground for jenkins + docker slave, jenkins pipeline etc.

This repo was created to quickly setup a local Jenkins + slave with docker capabilities. 
For experimenting with jenkins pipeline builds.

Docker is required since we use docker-compose to setup the services.
We configured a jenkins + slave. 

The first time you run `docker-compose up -d` you might want to check the logs for the
generated admin password. use `docker-compose logs`

The first time you login you will need to install/update some standard plugins.


### configuring the slave node

The slave node is already configured since we mount the config file in the docker-compose.yml. In case
you want to create an additional slave:

before the slave container can connect. define it in the jenkins master:

* manage jenkins >> manage nodes >> create node

* enter node name "jenkins-slave"

* select "permanent agent" (the only option available)

* in the node details add label "docker"

* for the rest use defaults (like execution mode == java webstart)


### configure login credentials or disable jenkins security

In recent jenkins version, security is enabled by default. The slave will not be able to connect unless you disable security or pass credentials 
from the jenkins-slave startup command (see docker-compose.yml):

`command: bash -c "curl http://jenkins:8080/jnlpJars/slave.jar -o /slave.jar && java -jar slave.jar -jnlpUrl http://jenkins:8080/computer/jenkins-slave/slave-agent.jnlp"`

You can try adding login credential to the jnlp command in docker-compose.yml like this: `-auth user:password`
but I did not tested this yet.

To disable security in jenkins: manage jenkins >> configure global security >> uncheck activate security 



