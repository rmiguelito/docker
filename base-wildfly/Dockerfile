FROM jdk-oracle:1.8_121

# Set the WILDFLY_VERSION env variable
ENV WILDFLY_VERSION 10.1.0.Final
ENV WILDFLY_SHA1 9ee3c0255e2e6007d502223916cefad2a1a5e333
ENV JBOSS_HOME /opt/wildfly

USER root

RUN groupadd jboss && useradd -r -g jboss -u 299 -c "Jboss|Wildfly Account" -d /opt/wildfly -s /bin/bash jboss

RUN cd $HOME \
    && curl -O https://download.jboss.org/wildfly/$WILDFLY_VERSION/wildfly-$WILDFLY_VERSION.tar.gz \
    && sha1sum wildfly-$WILDFLY_VERSION.tar.gz | grep $WILDFLY_SHA1 \
    && tar xf wildfly-$WILDFLY_VERSION.tar.gz \
    && mv $HOME/wildfly-$WILDFLY_VERSION $JBOSS_HOME \
    && rm wildfly-$WILDFLY_VERSION.tar.gz \
    && chown -R jboss:jboss ${JBOSS_HOME} \
    && chmod -R g+rw ${JBOSS_HOME}

	
# Install drivers
COPY ["postgresql-42.0.0.jar", "ojdbc7.jar", "cli-offline.sh", "$JBOSS_HOME/bin/"]
RUN $JBOSS_HOME/bin/jboss-cli.sh --file=$JBOSS_HOME/bin/cli-offline.sh	

RUN sed -i '$a\admin=2ed16248fbf0a8703adcd9f3dd181c39' $JBOSS_HOME/standalone/configuration/mgmt-users.properties $JBOSS_HOME/domain/configuration/mgmt-users.properties && \
    sed -i '$a\jenkins=997a8ca3e7b01b0cbe7453037010391f' $JBOSS_HOME/standalone/configuration/mgmt-users.properties $JBOSS_HOME/domain/configuration/mgmt-users.properties

RUN rm -rf ${JBOSS_HOME}/standalone/configuration/standalone_xml_history/*
	
# Ensure signals are forwarded to the JVM process correctly for graceful shutdown
ENV LAUNCH_JBOSS_IN_BACKGROUND true


# Expose the ports we're interested in
EXPOSE 8080 9990

# Set the default command to run on boot
# This will boot WildFly in the standalone mode and bind to all interface
CMD ["/opt/wildfly/bin/standalone.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]

