useradd jgeddes -m -s /bin/bash
echo "jgeddes:default" | chpasswd
chage -d 0 jgeddes
adduser jgeddes sudo
id jgeddes
