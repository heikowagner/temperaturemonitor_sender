#!/bin/bash
x=2
while (( $x > 1 ))
do
  echo "$(date) @ $(hostname)"
  cpu=$(</sys/class/thermal/thermal_zone0/temp)
  echo "$((cpu/1000)) c"

  echo "Welcome $x times"
  sleep 3s
  curl -H "Content-Type: application/json" -X GET http://$RECIEVERIP:65432/ -d "{\"Temperatur\":\"$cpu\", \"Hostname\": \"$(hostname)\", \"Time\": \"$(date)\"}"
  x=$(( $x + 1 ))
done
