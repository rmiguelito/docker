#!/bin/bash
docker run -p 9991:9990 -p 8081:8080 -p 8008:8009 -d -v /var/log/docker/conteiners:/var/log/wildfly 10.2.112.194:5000/pf/base-wildfly
