FROM centos:centos7

RUN sed -i "/distroverpkg=centos-release/a override_install_langs=en_US.utf8\ntsflags=nodocs" /etc/yum.conf && \
yum fs filter languages en && yum fs filter documentation && \
yum -y update && \
yum install -y firefox.x86_64 mozilla-ublock-origin.noarch firefox-noscript.noarch \
java-1.8.0-openjdk.x86_64 java-1.8.0-openjdk-headless.x86_64 icedtea-web.x86_64 ca-certificates.noarch \
adwaita-gtk2-theme.x86_64 adwaita-icon-theme.noarch && \
rm -rf /var/cache/yum /usr/share/doc/*

ENTRYPOINT ["/usr/bin/bash"]
CMD ["/usr/bin/bash"]

LABEL maintainer="Adrian.Sevcenco@spacescience.ro"
