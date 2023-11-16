swayidle -w timeout 600 'swaylock -f -c 000000' \
            timeout 602 'hyprctl dispatch dpms off' \
            resume 'hyprctl dispatch dpms on' \
            before-sleep 'swaylock -f -c 000000' &
