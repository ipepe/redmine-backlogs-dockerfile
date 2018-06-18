#!/bin/bash
docker run -d --name redmine -h redmine \
    -e VIRTUAL_HOST=redmine.ipepe.pl \
    -e LETSENCRYPT_HOST=redmine.ipepe.pl \
    -e LETSENCRYPT_EMAIL=letsencrypt@ipepe.pl \
    --restart=always -i -t -P \
    -v /opt/docker/redmine/data/sqlite:/usr/src/redmine/sqlite \
    -v /opt/docker/redmine/data/files:/my/own/datadir:/usr/src/redmine/files \
    ipepe/redmine
