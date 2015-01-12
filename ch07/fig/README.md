Recipe for fig
==============

To start a wordpress blog made of two containers do:

    $ vagrant up
    $ cd /vagrant
    $ fig up -d

Check the `fig.yml` file in `/vagrant`:

    wordpress:
      image: wordpress
      links:
       - mysql
      ports:
       - "80:80"
      environment:
       - WORDPRESS_DB_NAME=wordpress
       - WORDPRESS_DB_USER=wordpress
       - WORDPRESS_DB_PASSWORD=wordpresspwd 
    mysql:
      image: mysql
      volumes: 
       - /home/docker/mysql:/var/lib/mysql
      environment:
       - MYSQL_ROOT_PASSWORD=wordpressdocker
       - MYSQL_DATABASE=wordpress
       - MYSQL_USER=wordpress
       - MYSQL_PASSWORD=wordpresspwd
