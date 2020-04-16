#!/bin/bash

# ------------------------------------------------------------
# Setup ssh restrictions for user
# ------------------------------------------------------------
cat << EOF > /etc/ssh/sshd_config
Match User ${user}
   X11Forwarding no
   AllowAgentForwarding no
   PermitOpen ${host}:${port}
   ForceCommand echo 'Sorry. You are not allowed to do anything'
EOF

systemctl restart ssh


# ------------------------------------------------------------
# Add a user restricted to forwarding specified host:port
# ------------------------------------------------------------
useradd -m ${user} -s /bin/false


# ------------------------------------------------------------
# Add ssh pub keys to access the instance
# ------------------------------------------------------------
FILE=/home/${user}/.ssh/authorized_keys

export IFS=";"
for pubkey in "${pubkeys}"; do
  echo "$pubkey" >> $FILE
done

chown ${user}: $FILE
chmod 0600 $FILE