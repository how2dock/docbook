Create CA, server and client keys for Docker TLS communications
===============================================================

Build the image

    docker build -t openssl .

Run it interactively

    docker run -v $(pwd):/tmp/ca -ti openssl <HOSTNAME>

The CA, Server and Client keys and certs will now be in your current path.
Move them the appropriate `.docker` directory and enjoy Docker over TLS

This image is available on the Docker Hub as runseb/dockertls

    docker pull runseb/dockertls
