
alias dockershell='docker run --rm -it --entrypoint=/bin/bash'
alias dockershellsh='docker run --rm -it --entrypoint=/bin/sh'

alias metasploit='docker run --rm -it -v "${HOME}/.msf4:/home/msf/.msf4" metasploitframework/metasploit-framework ./msfconsole'

alias metasploitports='docker run --rm -it -v "${HOME}/.msf4:/home/msf/.msf4" -p 8443-8500:8443-8500 metasploitframework/metasploit-framework ./msfconsole'

alias msfvenomhere='docker run --rm -it -v "${HOME}/.msf4:/home/msf/.msf4" -v "${PWD}:/data" metasploitframework/metasploit-framework ./msfvenom'

alias nmap='grc nmap'

alias ls='exa'
alias less='less -R'
