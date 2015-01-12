FROM ubuntu:14.04

MAINTAINER toto@toto.com

RUN apt-get update
RUN apt-get install -y nginx

RUN echo "toto is toto" > /usr/share/nginx/html/index.html

CMD ["nginx","-g","daemon off;"]

EXPOSE 80
