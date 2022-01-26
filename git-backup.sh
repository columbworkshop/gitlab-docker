#!/bin/bash
docker exec -t gitlab gitlab-backup create
#
docker cp gitlab:/var/opt/gitlab/backups/ /srv/docker/gitlab/gitbackups/
#
s3cmd --storage-class COLD sync /srv/docker/gitlab/gitbackups s3://filebackups/
#
docker exec -t gitlab rm -rf /var/opt/gitlab/backups/*
#
rm -rf /srv/docker/gitlab/gitbackups/*
#
