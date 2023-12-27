su mara -c 'env DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus notify-send "starting timeshift backup for host $HOSTNAME..."'

sudo timeshift --create --comments "$(date)"

if [[ $? == 0 ]]; then
  su mara -c 'env DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus notify-send "timeshift backup on $(date) successful"'
else
  su mara -c 'env DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus notify-send "FAILURE: timeshift backup on $(date) unsuccessful"'
fi
