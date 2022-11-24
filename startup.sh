#!/bin/bash

sudo apt-get update

# setup docker and nginx

sudo apt-get install -y curl wget

curl -fsSL https://get.docker.com | bash
sudo docker pull nginx

# Setup amazon-efs-utils

sudo apt-get install -y git binutils

cd /home/

git clone https://github.com/aws/efs-utils

cd efs-utils

./build-deb.sh

sudo apt-get -y install ./build/amazon-efs-utils*deb

cd /home/

if echo $(python3 -V 2>&1) | grep -e "Python 3.6"; then
    sudo wget https://bootstrap.pypa.io/pip/3.6/get-pip.py -O /tmp/get-pip.py
elif echo $(python3 -V 2>&1) | grep -e "Python 3.5"; then
    sudo wget https://bootstrap.pypa.io/pip/3.5/get-pip.py -O /tmp/get-pip.py
elif echo $(python3 -V 2>&1) | grep -e "Python 3.4"; then
    sudo wget https://bootstrap.pypa.io/pip/3.4/get-pip.py -O /tmp/get-pip.py
else
    sudo apt-get -y install python3-distutils
    sudo wget https://bootstrap.pypa.io/get-pip.py -O /tmp/get-pip.py
fi

sudo python3 /tmp/get-pip.py
sudo pip3 install botocore

mkdir efs

efs_id="${efs_id}"

echo "[!] Sleeping for 120 secs"
sleep 120

echo "[+] Running: mount -t efs $efs_id:/ /usr/share/nginx/html"

sudo mount -t efs $efs_id:/ /home/efs

cd /home/efs

sudo git clone https://github.com/cloudacademy/static-website-example.git .

sudo docker run -d --name nginx -p 80:80 -v /home/efs:/usr/share/nginx/html nginx
