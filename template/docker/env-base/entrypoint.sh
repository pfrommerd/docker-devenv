#!/usr/bin/env bash
groupadd --gid $EXT_GID $EXT_USER
useradd -d /home/$EXT_USER -s /usr/bin/fish --uid $EXT_UID -g $EXT_USER $EXT_USER

# Allow images to define a REOWN_PATHS
if [ ! -z $USER_REOWN_PATHS ]
    then
    chown -R $EXT_USER:$EXT_USER $USER_REOWN_PATHS
fi

cd /home/$EXT_USER/code
su $EXT_USER
