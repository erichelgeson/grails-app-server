# Grails App Server

This is an opinionated server build to deploy Java apps such as Grails2/3, Spring Boot, or any runnable jar.

The `chef-repo` folder should live with your application, so your infrastructure and application are versioned and move through testing at the same time (app version 1.2.3 == infrastructure version 1.2.3)

# Opinions

* CentOS 7
 - Because I don't like doing OS upgrades every 6 months
* Java 8
* Chef 12
* nginx as a reverse proxy
 - 1000 line `httpd.conf` hurt
* postgresql-server 9

# Enhancements

* Add redis/caching layer in for sessions
* Blue/Green deploy script
