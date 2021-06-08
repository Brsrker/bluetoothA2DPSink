#!/usr/bin/expect -f

bluetoothctl --agent=NoInputNoOutput <<EOF
    system-alias "Sedona"
    power on
    pairable on
    discoverable-timeout 9999999999999999999
    discoverable on
    default-agent
    quit
EOF

bt-agent --capability=NoInputNoOutput --daemon

while [ true ]
do
	sleep 60s
	bluetoothctl --agent=NoInputNoOutput <<EOF
    discoverable on
    quit
EOF
done