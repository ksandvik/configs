# Local dev setup per system

# ROKU DEV
set -gx ROKU_DEV_TARGET 192.168.50.133
set -gx BRYAN 192.168.50.133
set -gx BENJAMIN 192.168.50.5
set -gx BENJAMINSJ 10.2.134.163
set -gx DEVPASSWORD ahov

# ROKU
abbr -a ms ssh -X ksandvik@10.3.248.180 -p 9022

# SERIAL LOGS
abbr -a ben-serial 'picocom --baud 460800 /dev/tty.usbserial-14400'

