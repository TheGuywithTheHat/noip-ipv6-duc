#!/bin/bash

interface="INTERFACE e.g. enp3s0"
user="EMAIL"
pass="PASSWORD"
hostname="HOSTNAME"

url="https://dynupdate.no-ip.com/nic/update"
agent="Personal noip-ducv6/linux-v1.0"

lastaddr=''

update_ip () {
    addr=$(ip addr show dev $interface | sed -e's/^.*inet6 \([^ ]*\)\/.*scope global.*$/\1/;t;d')
    if [[ $lastaddr != $addr ]]; then
        echo "updating to $addr"
        out=$(curl --get --silent --show-error --user-agent "$agent" --user "$user:$pass" -d "hostname=$hostname" -d "myipv6=$addr" $url)

        echo $out

        if [[ $out == nochg* ]] || [[ $out == good* ]]; then
            lastaddr=$addr
        elif [[ $out == 911 ]]; then
            echo "911 response, waiting 30 minutes"
            sleep 25m
        else
            exit 1
        fi
    fi
}

update_ip
while sleep 5m; do
    update_ip
done
