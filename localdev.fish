# Local dev setup per system

# Set Local PATHS
set -gx PATH /opt/homebrew/bin /opt/homebrew/opt/ruby/bin ~/.local/bin ~/odin/toolchain $PATH

# ROKU DEV
set -gx ROKU_DEV_TARGET 192.168.50.133
set -gx BRYAN 192.168.50.133
set -gx BENJAMIN 192.168.50.5
set -gx BENJAMINSJ 10.2.134.163
set -gx DEVPASSWORD ahov

# ROKU
abbr -a ms ssh -X ksandvik@10.3.248.180 -p 9022

# 1AND1
abbr -a 1and1 ssh 'u35697510@home92371126.1and1-data.host'
abbr -a aws ssh 'ksandvik@10.228.210.60'

# GIT
set -gx GITGET_ROOT ~/ic/Programming/Go/src

# MOJO
set -gx MODULAR_HOME /Users/ksandvik/.modular
set -gx PATH ~/.modular/pkg/packages.modular.com_mojo/bin $PATH

# SERIAL LOGS
abbr -a ben-serial 'picocom --baud 460800 /dev/tty.usbserial-14400'

# LUNARVIM
abbr -a lv '~/.local/bin/lvim'

# MISC PRIVATE
abbr -a ksdictwords ' ls /Volumes/Work/TibWorkspace/KSDict/ | wc -l'
set -gx KSNOTES /Users/ksandvik/ic/KSNotes

# DIRENV HOOK
# direnv hook fish | source

# ZOXIDE
/opt/homebrew/bin/zoxide init fish | source
