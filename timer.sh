#!/bin/bash
sudo cat << EOF > /etc/sysconfig/watchlog
# Configuration file for my watchlog service
# Place it to /etc/sysconfig

# File and word in that file that we will be monit
WORD="ALERT"
LOG=/var/log/watchlog.log
EOF
sudo cat << EOF > /var/log/watchlog.log
12345
ALERT
qwerty
qazwsxedc
fgjhkfdljnvl
EOF
sudo wget -O /opt/watchlog.sh  https://github.com/sashant157/test/blob/main/vatchlog.sh?raw=true
sudo chmod +x /opt/watchlog.sh
sudo wget -O /etc/systemd/system/watchlog.service https://github.com/sashant157/test/blob/main/watchlog.service?raw=true
sudo wget -O /etc/systemd/system/watchlog.timer https://github.com/sashant157/test/blob/main/watchlog.timer?raw=true
sudo systemctl daemon-reload
sudo systemctl start watchlog.timer
sudo systemctl start watchlog.service
sudo yum install epel-release -y && yum install -y spawn-fcgi php php-cli
sudo wget -O /etc/sysconfig/spawn-fcgi https://github.com/sashant157/test/blob/main/spawn-fcgi?raw=true
sudo wget -O /etc/systemd/system/spawn-fcgi.service https://github.com/sashant157/test/blob/main/spawn-fcgi.service?raw=true
sudo systemctl start spawn-fcgi.service
sudo wget -O /usr/lib/systemd/system/httpd.service https://github.com/sashant157/test/blob/main/httpd.service?raw=true
sudo cat << EOF > /etc/sysconfig/httpd-first
OPTIONS=-f conf/first.conf
EOF
cat << EOF > /etc/sysconfig/httpd-second
OPTIONS=-f conf/second.conf
EOF
sudo wget -O /etc/httpd/conf/first.conf https://github.com/sashant157/test/blob/main/first.conf?raw=true
sudo wget -O /etc/httpd/conf/second.conf https://github.com/sashant157/test/blob/main/second.conf?raw=true
sudo systemctl start httpd@first
sudo systemctl start httpd@second
