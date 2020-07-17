#!/bin/bash

PURPLE='\033[0;35m'
RED='\033[0;31m'
ORANGE='\033[0;33m'
CYAN='\033[0;36m'
NOCOLOR='\033[0m'

# kill lingering rails server
function flush {
	if [[ -f ./tmp/pids/server.pid ]]
	then
	  DEAD_PORT=$(<./tmp/pids/server.pid)
    if ps -p $DEAD_PORT | grep -q $DEAD_PORT 
    then 
      kill -9 $(<./tmp/pids/server.pid)
      printf "${CYAN}Removed server on port ${DEAD_PORT}${NOCOLOR}.\n" 
    else
      printf "${ORANGE}Server is aleady ${RED}dead${NOCOLOR}.\n"
    fi
	else
	  printf "${PURPLE}No server running in this directory${NOCOLOR}.\n"
	fi
}

flush