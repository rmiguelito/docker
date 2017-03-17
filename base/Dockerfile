FROM 10.2.112.194:18079/rhel7.3
MAINTAINER  Rodrigo Miguel  rodrigomvi@algartech.com
COPY dpf.repo /etc/yum.repos.d/
ENV HTTP_PROXY http://proxy.dpf.gov.br:3128
ENV FTP_PROXY http://proxy.dpf.gov.br:3128
ENV HTTPS_PROXY http://proxy.dpf.gov.br:3128
ENV TZ=America/Sao_Paulo
RUN yum clean all
RUN yum -y install \
  vim \
  net-tools \
  iputils \
  telnet \
  nmap \
  tcpdump \
  tar \
  unzip \
  initscripts \
  ntpdate \
<<<<<<< HEAD
  crontabs.noarch 
=======
  bzip2 \
  crontabs.noarch 
RUN yum clean all
>>>>>>> 9ad3b3ccffdbae411a78598eb0b3e4bfefb2776d
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN ntpdate -u ntp.pf.gov.br && sed -i '$a\0,30 *  *  *  *         root            ntpdate -u ntp.pf.gov.br >/dev/null 2>&1' /etc/crontab
