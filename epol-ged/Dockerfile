FROM 10.2.112.194:5000/pf/base-node
MAINTAINER  Rodrigo Miguel  rodrigomvi@algartech.com

WORKDIR /usr/src/app

# Bundle app source
COPY . /usr/src/app/

# Install app dependencies
RUN cd /usr/src/app
RUN npm install 

EXPOSE 8080
CMD [ "node", "index.js" ]

