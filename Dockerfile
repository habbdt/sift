# Dockerfile for sans-sift
FROM ubuntu:18.04
LABEL updated="21 April 2021"

# install sift
RUN mkdir -p /var/tmp/scripts
COPY install_script.sh /var/tmp/scripts
WORKDIR /var/tmp/scripts
RUN chmod +x install_script.sh
RUN ./install_script.sh

# sansforensics
USER sansforensics
WORKDIR /home/sansforensics
CMD ["/usr/bin/whoami"]