#!/bin/sh
set -x

if [ -f "./partials/config.$HOSTNAME" ]
then
    cat "./partials/config.head" "./partials/config.$HOSTNAME" "./partials/config.tail" > config
else
    cat "./partials/config.head" "./partials/config.tail" > config
fi

