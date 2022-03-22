#!/bin/bash

set -e

main(){
    openssl req -x509 -newkey rsa:4096 -sha256 -nodes -keyout root.key -out root.crt -days 365 -subj "//C=TW/ST=Taipei/O=Hahaha Co., Ltd./OU=Hahaha/CN=Hahaha Co., Ltd./emailAddress=support@hahah.com"

    openssl genrsa -out server.key 2048

    openssl req -new -key server.key -sha256 -out server.csr -config ssl.conf

    openssl x509 -req -in server.csr -CA root.crt -CAkey root.key \
    -CAcreateserial -out server.crt -days 365 -sha256 -extfile ext.conf
}

main
