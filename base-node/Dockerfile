FROM 10.2.112.194:5000/pf/base:1.0
MAINTAINER  Rodrigo Miguel  rodrigomvi@algartech.com

# Install NodeJS
RUN yum install nodejs -y && yum clean all
RUN npm install express body-parser keycloak-connect html-pdf winston http-status-codes lodash spdy
ENV appDir /usr/src/app/

# Create app directory
RUN mkdir -p $appDir
WORKDIR $appDir

# Bundle app source
COPY . $appDir

# Install app dependencies
RUN cd $appDir
RUN npm install

CMD [ "node", "index.js" ]
