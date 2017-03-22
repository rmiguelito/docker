FROM centos
MAINTAINER  Rodrigo Miguel  rodrigomvi@algartech.com

ENV EAP_VERSION 7.0.0
ENV KEYCLOAK_ADAPTER_VERSION 2.5.0.Final
ENV JBOSS_HOME /opt/jboss-eap-$EAP_VERSION

RUN groupadd jboss && useradd -r -g jboss -u 299 -c "Jboss Account" -d /opt/eap7 -s /bin/bash jboss
RUN mkdir /opt/jboss-eap-$EAP_VERSION

COPY jboss-eap-$EAP_VERSION /opt/jboss-eap-$EAP_VERSION
#RUN cd /opt && unzip jboss-$EAP_VERSION.zip && rm -f jboss-$EAP_VERSION.zip && mv jboss-$EAP_VERSION jboss

COPY ["postgresql-9.4.1212.jre7.jar", "ojdbc7.jar", "cli-offline.sh", "$JBOSS_HOME/bin/"]
RUN $JBOSS_HOME/bin/jboss-cli.sh --file=$JBOSS_HOME/bin/cli-offline.sh

RUN cd $JBOSS_HOME && curl -O https://downloads.jboss.org/keycloak/$KEYCLOAK_ADAPTER_VERSION/adapters/keycloak-oidc/keycloak-wildfly-adapter-dist-$KEYCLOAK_ADAPTER_VERSION.tar.gz --proxy http://proxy.dpf.gov.br:3128 && tar -xf keycloak-wildfly-adapter-dist-$KEYCLOAK_ADAPTER_VERSION.tar.gz && \
rm -f \
keycloak-jboss-adapter-dist-$KEYCLOAK_ADAPTER_VERSION.tar.gz \
bin/cli-offline.sh \
bin/postgresql-9.4.1212.jre7.jar \
bin/ojdbc7.jar

RUN sed -i '$a\admin=2ed16248fbf0a8703adcd9f3dd181c39' $JBOSS_HOME/standalone/configuration/mgmt-users.properties $JBOSS_HOME/domain/configuration/mgmt-users.properties && \
    sed -i '$a\jenkins=997a8ca3e7b01b0cbe7453037010391f' $JBOSS_HOME/standalone/configuration/mgmt-users.properties $JBOSS_HOME/domain/configuration/mgmt-users.properties && \
    sed -i -e 's/<extensions>/&\n        <extension module="org.keycloak.keycloak-adapter-subsystem"\/>/' $JBOSS_HOME/standalone/configuration/standalone.xml && \
    sed -i -e 's/<profile>/&\n        <subsystem xmlns="urn:jboss:domain:keycloak:1.1"\/>/' $JBOSS_HOME/standalone/configuration/standalone.xml && \
    sed -i -e 's/<security-domains>/&\n                <security-domain name="keycloak">\n                    <authentication>\n                        <login-module code="org.keycloak.adapters.jboss.KeycloakLoginModule" flag="required"\/>\n                    <\/authentication>\n                <\/security-domain>/' $JBOSS_HOME/standalone/configuration/standalone.xml

RUN mkdir -p \
/var/log/jboss \
/var/run/jboss

RUN chown jboss: -R \
$JBOSS_HOME \
/var/log/jboss \
/var/run/jboss

EXPOSE 8009 8080 9990 
CMD ["/opt/jboss-eap-7.0.0/bin/standalone.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0", "-Djboss.bind.address.unsecure=0.0.0.0", "-Djboss.server.base.dir=/opt/jboss-eap-7.0.0/standalone", "-Djboss.server.log.dir=/var/log/jboss"]
