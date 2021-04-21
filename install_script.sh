#!/bin/bash

########README#########################
# install sans sift in ubuntu container
#######################################

# install required packages
apt-get update && apt-get install -y --no-install-recommends --allow-unauthenticated wget sudo gnupg2 ca-certificates

# useradd sansforensics
useradd -m -s /bin/bash sansforensics
yes "forensics" | passwd sansforensics

# sudoers for sansforensics uers
echo "sansforensics      ALL=(ALL)   NOPASSWD: ALL" >> /etc/sudoers.d/sansforensics

# download sift
mkdir -p /var/tmp/sift
wget -O /var/tmp/sift/sift-cli-linux https://github.com/teamdfir/sift-cli/releases/download/v1.10.0-rc5/sift-cli-linux --no-check-certificate
mv /var/tmp/sift/sift-cli-linux /usr/local/bin/sift
chmod 0755 /usr/local/bin/sift

# sift install
sudo -u sansforensics -H sh -c  "sudo /usr/local/bin/sift install --mode=server --user=sansforensics"