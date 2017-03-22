FROM base-jdk
MAINTAINER  Rodrigo Miguel  rodrigomvi@algartech.com

ENV WILDFLY_VERSION 10.1.0.Final
ENV KEYCLOAK_ADAPTER_VERSION 2.1.0.Final
ENV JBOSS_HOME /opt/wildfly

RUN groupadd wildfly && useradd -r -g wildfly -u 299 -c "Jboss|Wildfly Account" -d /opt/wildfly -s /bin/bash wildfly

COPY wildfly-$WILDFLY_VERSION.zip /opt
RUN cd /opt && unzip wildfly-$WILDFLY_VERSION.zip && rm -f wildfly-$WILDFLY_VERSION.zip && mv wildfly-$WILDFLY_VERSION wildfly

COPY ["postgresql-9.4.1209.jre7.jar", "ojdbc7.jar", "cli-offline.sh", "$JBOSS_HOME/bin/"]
RUN $JBOSS_HOME/bin/jboss-cli.sh --file=$JBOSS_HOME/bin/cli-offline.sh

RUN cd $JBOSS_HOME && curl -O https://downloads.jboss.org/keycloak/$KEYCLOAK_ADAPTER_VERSION/adapters/keycloak-oidc/keycloak-wildfly-adapter-dist-$KEYCLOAK_ADAPTER_VERSION.tar.gz --proxy http://proxy.dpf.gov.br:3128 && tar -xf keycloak-wildfly-adapter-dist-$KEYCLOAK_ADAPTER_VERSION.tar.gz && \
rm -f \
keycloak-wildfly-adapter-dist-$KEYCLOAK_ADAPTER_VERSION.tar.gz \
bin/cli-offline.sh \
bin/postgresql-9.4.1209.jre7.jar \
bin/ojdbc7.jar

RUN sed -i '$a\admin=2ed16248fbf0a8703adcd9f3dd181c39' $JBOSS_HOME/standalone/configuration/mgmt-users.properties $JBOSS_HOME/domain/configuration/mgmt-users.properties && \
    sed -i '$a\jenkins=997a8ca3e7b01b0cbe7453037010391f' $JBOSS_HOME/standalone/configuration/mgmt-users.properties $JBOSS_HOME/domain/configuration/mgmt-users.properties && \
    sed -i -e 's/<extensions>/&\n        <extension module="org.keycloak.keycloak-adapter-subsystem"\/>/' $JBOSS_HOME/standalone/configuration/standalone.xml && \
    sed -i -e 's/<profile>/&\n        <subsystem xmlns="urn:jboss:domain:keycloak:1.1"\/>/' $JBOSS_HOME/standalone/configuration/standalone.xml && \
    sed -i -e 's/<security-domains>/&\n                <security-domain name="keycloak">\n                    <authentication>\n                        <login-module code="org.keycloak.adapters.jboss.KeycloakLoginModule" flag="required"\/>\n                    <\/authentication>\n                <\/security-domain>/' $JBOSS_HOME/standalone/configuration/standalone.xml

RUN mkdir -p \
/var/log/wildfly \
/var/run/wildfly

RUN chown wildfly: -R \
$JBOSS_HOME \
/var/log/wildfly \
/var/run/wildfly

EXPOSE 8009 8080 9990 
CMD ["/opt/wildfly/bin/standalone.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0", "-Djboss.bind.address.unsecure=0.0.0.0", "-Djboss.domain.base.dir=/opt/wildfly/standalone", "-Djboss.server.log.dir=/var/log/wildfly"]
