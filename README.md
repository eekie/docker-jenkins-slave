This repo was created to quickly setup a local Jenkins + slave with docker capabilities. 
For experimenting with jenkins pipeline builds.

Docker is required since we use docker-compose to setup the services.

The first time you run `docker-compose up -d` you might want to check the logs for the
generated admin password. use `docker-compose logs`


### configuring the slave node

The slave node is already configured since we mount the config file in the docker-compose.yml. In case
you want to create an additional slave:

* manage jenkins >> manage nodes >> create node

* enter node name "jenkins-slave"

* select "permanent agent" (the only option available)

* in the node details add label "docker"

* for the rest use defaults (like execution mode == java webstart)


### configure login credentials or disable jenkins security

If security is enabled in your jenkins instance the slave will not be able to connect unless you disable 
security or pass credentials from the jenkins-slave startup command (see entrypoint.sh in slave container)

You can try adding login credential like this: `-auth user:password` but I did not tested this myself.

To disable security in jenkins: manage jenkins >> configure global security >> uncheck activate security 



