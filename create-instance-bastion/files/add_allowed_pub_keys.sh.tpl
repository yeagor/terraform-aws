#!/bin/bash

# ------------------------------------------------------------
# Setup ssh restrictions for user
# ------------------------------------------------------------
cat << EOF >> /etc/ssh/sshd_config
###############################################################
Match User ${user}
   X11Forwarding no
   AllowAgentForwarding no
   PermitOpen ${host}:${port}
   ForceCommand echo 'Sorry. You are not allowed to do anything!'
################################################################

EOF
systemctl restart ssh


# ------------------------------------------------------------
# Add a user restricted to forwarding specified host:port
# ------------------------------------------------------------
useradd -m ${user} -s /bin/false || echo "User ${user} already exists"


# ------------------------------------------------------------
# Add ssh pub keys to access the instance
# ------------------------------------------------------------
DIR=/home/${user}/.ssh
mkdir $DIR || echo "Directory $DIR already exists"
chown -R ${user} $DIR
chmod 700 $DIR

FILE=$DIR/authorized_keys
# ensure keys won't duplicate after instance restart
echo > $FILE
IFS=';' read -ra keys <<< "${pubkeys};"
for pubkey in "$${keys[@]}"; do
  echo "$pubkey" >> $FILE
done
chown ${user}: $FILE
chmod 0600 $FILE
