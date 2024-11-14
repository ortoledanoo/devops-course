#!/bin/bash
# Script To Set New IP in Docker-Compose

current_ip=$(curl -s ifconfig.me)

docker_compose_path="/home/ubuntu/docker-compose.yml"

sed -i "s|external_url 'https://[0-9.]*'|external_url 'https://$current_ip'|" "$docker_compose_path"

docker-compose -f "$docker_compose_path" down
docker-compose -f "$docker_compose_path" up -d

