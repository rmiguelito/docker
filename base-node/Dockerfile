FROM centos
MAINTAINER  Rodrigo Miguel  rodrigomvi@algartech.com

ENV appDir /usr/src/app/

# Install NodeJS
RUN yum install nodejs -y && yum clean all

# Create app directory
RUN mkdir -p $appDir
WORKDIR $appDir

# Bundle app source
COPY . $appDir

# Install app dependencies
RUN cd $appDir
RUN npm install

CMD [ "node", "index.js" ]