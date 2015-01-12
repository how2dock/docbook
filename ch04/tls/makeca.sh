#!/bin/bash

#srl file for CA
echo 01 > ca.srl

#generate CA
openssl genrsa -des3 -out cakey.pem 2048
openssl req -new -x509 -days 365 -key cakey.pem -out ca.pem

#generate server cert
openssl genrsa -des3 -out serverkey.pem 2048
openssl req -subj "/CN=$1" -new -key serverkey.pem -out server.csr
openssl rsa -in serverkey.pem -out serverkey.pem
openssl x509 -req -days 365 -in server.csr -CA ca.pem -CAkey cakey.pem -out servercert.pem

#extension file
echo extendedKeyUsage = clientAuth > extfile.cnf

#generate client key
openssl genrsa -des3 -out clientkey.pem 2048
openssl req -subj '/CN=client' -new -key clientkey.pem -out client.csr
openssl rsa -in clientkey.pem -out clientkey.pem
openssl x509 -req -days 365 -in client.csr -CA ca.pem -CAkey cakey.pem -out clientcert.pem -extfile extfile.cnf
