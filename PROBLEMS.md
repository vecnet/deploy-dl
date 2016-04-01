Problems with deploy
====================

This is a list of issues which have come up during a deploy, for easy reference.


 *    TASK: [postgres | Add vecnet database] **************************************** 
    failed: [dl-vecnet.crc.nd.edu] => {"failed": true}
    msg: unable to connect to database: FATAL:  Ident authentication failed for user "postgres"

Ansible was trying to become the postgres user using `psql -U postgres` instead of `su -u postgres psql`
see https://github.com/ansible/ansible/issues/2107 for workaround

 *   TASK: [disadis | wait for service] ******************************************** 
    failed: [dl-vecnet.crc.nd.edu] => {"elapsed": 10, "failed": true}
    msg: Timeout when waiting for 127.0.0.1:4000

Disadis couldn't get port because of the PREVIOUS disadis. Seems to be an issue only when deploying ansible over an old server image.

 *    get 502 bad gateway

Restart nginx

 *   do not get style sheets

The solr config (in `config/solr.yml`) did not begin with "http://".

 *   solr is not running

Though the right version of java was installed (1.7), the system is still using java 1.6 to start tomcat.
run: `sudo /usr/sbin/alternatives --config java` to switch that. And also switch `javac` using a similar command.





