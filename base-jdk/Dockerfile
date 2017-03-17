FROM pf/base
MAINTAINER  Rodrigo Miguel  rodrigomvi@algartech.com

ENV JAVA_HOME /opt/jdk1.8_111
ENV JAVA_BINDIR $JAVA_HOME/bin
ENV JAVA_ROOT $JAVA_HOME
ENV PATH=$PATH:$JAVA_HOME/bin
ENV JAVA_CACERTS $JAVA_HOME/jre/lib/security/cacerts

COPY jdk-8u111-linux-x64.tar.gz /opt
RUN cd /opt && \
tar -xzf jdk-*.tar.gz && rm -f jdk-*.tar.gz && \
mv jdk* jdk1.8_111

RUN mkdir $JAVA_HOME/certs
ADD certs/ $JAVA_HOME/certs

RUN echo "yes" | keytool --storepass changeit -import -keystore $JAVA_CACERTS -file $JAVA_HOME/certs/Autoridade_Certificadora_do_Serpro_Final_v3.crt -alias SerproFinalv3 && \
echo "yes" | keytool --storepass changeit -import -keystore $JAVA_CACERTS -file $JAVA_HOME/certs/Autoridade_Certificadora_do_Serpro_Final_v4.crt -alias SerproFinalv4 && \
echo "yes" | keytool --storepass changeit -import -keystore $JAVA_CACERTS -file $JAVA_HOME/certs/Autoridade_Certificadora_Serpro_v2.crt -alias Serprov2 && \
echo "yes" | keytool --storepass changeit -import -keystore $JAVA_CACERTS -file $JAVA_HOME/certs/Autoridade_Certificadora_Serpro_v3.crt -alias Serprov3 && \
echo "yes" | keytool --storepass changeit -import -keystore $JAVA_CACERTS -file $JAVA_HOME/certs/Autoridade_Certificadora_Serpro_v4.crt -alias Serprov4 && \
echo "yes" | keytool --storepass changeit -import -keystore $JAVA_CACERTS -file $JAVA_HOME/certs/ICP-Brasil_AC_Raiz_v1.crt -alias AC_Raiz_ICP-Brasilv1 && \
echo "yes" | keytool --storepass changeit -import -keystore $JAVA_CACERTS -file $JAVA_HOME/certs/ICP-Brasilv2.crt -alias ICP-Brasilv2 && \
#ERRO# echo "yes" | keytool --storepass changeit -import -keystore $JAVA_CACERTS -file $JAVA_HOME/certs/ICP-Brasilv4.crt -alias ICP-Brasilv4 && \
echo "yes" | keytool --storepass changeit -import -keystore $JAVA_CACERTS -file $JAVA_HOME/certs/ICP-Brasilv5.crt -alias ICP-Brasilv5 && \
echo "yes" | keytool --storepass changeit -import -keystore $JAVA_CACERTS -file $JAVA_HOME/certs/PF-CA_2012-2017.crt -alias PF-CA_2012-2017 && \
echo "yes" | keytool --storepass changeit -import -keystore $JAVA_CACERTS -file $JAVA_HOME/certs/PF-CA_2015-2055.crt -alias PF-CA_2015-2055 && \
echo "yes" | keytool --storepass changeit -import -keystore $JAVA_CACERTS -file $JAVA_HOME/certs/full-chain-letsencrypt.pem -alias CA-LETSENCRYPT
