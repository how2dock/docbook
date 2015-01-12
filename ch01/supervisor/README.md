Running Wordpress with httpd and mysql running in the same container
====================================================================

Docker encourages the separtion of services, hence it is better to run a mysql container and a http container.

However there might be cases where running both services in the same container is required. In that case using supervisor is a good solution.

In this Dockerfile we see how we install all Wordpress dependencies in the same container and run both mysql and http via supervisord.

Build the container:

    docker build -t wordpress .

Then run it:

    docker run -d -p 80:80 wordpress

Open your browser on the IP of the Vagrant VM and enjoy configuring Wordpress
