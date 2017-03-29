FROM centos
MAINTAINER  Rodrigo Miguel  rodrigomvi@algartech.com

ENV JAVA_VERSION 8u121
ENV JAVA_HOME /opt/jdk$JAVA_VERSION
ENV JAVA_BINDIR $JAVA_HOME/bin
ENV JAVA_ROOT $JAVA_HOME
ENV PATH=$PATH:$JAVA_HOME/bin
ENV JAVA_CACERTS $JAVA_HOME/jre/lib/security/cacerts

USER root 

RUN curl -j -k -L -H "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/$JAVA_VERSION-b13/e9e7ea248e2c4826b92b3f075a80e441/jdk-$JAVA_VERSION-linux-x64.tar.gz -o /opt/jdk-$JAVA_VERSION-linux-x64.tar.gz
RUN cd /opt && tar -xvf jdk-$JAVA_VERSION-linux-x64.tar.gz && rm -f jdk-*.tar.gz && mv jdk1.8* jdk$JAVA_VERSION

RUN alternatives --install "/usr/bin/java" "java" "$JAVA_HOME/bin/java" 2000

RUN mkdir $JAVA_HOME/certs
ADD certs/ $JAVA_HOME/certs

RUN echo "yes" | $JAVA_BINDIR/keytool --storepass changeit -import -keystore $JAVA_CACERTS -file $JAVA_HOME/certs/Autoridade_Certificadora_do_Serpro_Final_v3.crt -alias SerproFinalv3 && \
echo "yes" | $JAVA_BINDIR/keytool --storepass changeit -import -keystore $JAVA_CACERTS -file $JAVA_HOME/certs/Autoridade_Certificadora_do_Serpro_Final_v4.crt -alias SerproFinalv4 && \
echo "yes" | $JAVA_BINDIR/keytool --storepass changeit -import -keystore $JAVA_CACERTS -file $JAVA_HOME/certs/Autoridade_Certificadora_Serpro_v2.crt -alias Serprov2 && \
echo "yes" | $JAVA_BINDIR/keytool --storepass changeit -import -keystore $JAVA_CACERTS -file $JAVA_HOME/certs/Autoridade_Certificadora_Serpro_v3.crt -alias Serprov3 && \
echo "yes" | $JAVA_BINDIR/keytool --storepass changeit -import -keystore $JAVA_CACERTS -file $JAVA_HOME/certs/Autoridade_Certificadora_Serpro_v4.crt -alias Serprov4 && \
echo "yes" | $JAVA_BINDIR/keytool --storepass changeit -import -keystore $JAVA_CACERTS -file $JAVA_HOME/certs/ICP-Brasilv2.crt -alias ICP-Brasilv2 && \
echo "yes" | $JAVA_BINDIR/keytool --storepass changeit -import -keystore $JAVA_CACERTS -file $JAVA_HOME/certs/ICP-Brasilv5.crt -alias ICP-Brasilv5 && \
echo "yes" | $JAVA_BINDIR/keytool --storepass changeit -import -keystore $JAVA_CACERTS -file $JAVA_HOME/certs/full-chain-letsencrypt.pem -alias CA-LETSENCRYPT && \
rm -rf $JAVA_HOME/certs


