#!/bin/bash
echo "defina o offset do EAP" ; read offset
management=$(($offset + 9990))
http=$(($offset + 8080))
ajp=$(($offset + 8009))
sudo docker run -p $management:9990 -p $http:8080 -p $ajp:8009 -d -v /var/log/docker/conteiners:/var/log/jboss 10.2.112.194:5000/pf/base-eap >/dev/null 2>&1

if [ $? -eq 0 ]
then
    echo "The container is available on the ports:"
    echo "Management" $management 
    echo "Public" $http
    echo "Ajp" $ajp
else echo "Offset already in use TRY AGAIN"
fi
