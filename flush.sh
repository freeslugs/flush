#!/bin/bash

PURPLE='\033[0;35m'
RED='\033[0;31m'
ORANGE='\033[0;33m'
CYAN='\033[0;36m'
NOCOLOR='\033[0m'

# kill zombie rails server
function flush_rails {
	if [[ -f ./tmp/pids/server.pid ]]
	then
	  DEAD_PID=$(<./tmp/pids/server.pid)
    if ps -p $DEAD_PID | grep -q $DEAD_PID 
    then 
      kill -9 $(<./tmp/pids/server.pid)
      printf "${CYAN}Removed zombie server with PID ${DEAD_PID}${NOCOLOR}.\n" 
    else
      printf "${ORANGE}Server is aleady ${RED}dead${NOCOLOR}.\n"
    fi
	else
	  printf "${PURPLE}No server running in this directory${NOCOLOR}.\n"
	fi
}

# kill zombie postgres
function flush_pg {
  PG_RUNNING=$(pg_isready -h localhost)
  if [[ $PG_RUNNING == *"accepting connections"* ]]
  then
    printf "${PURPLE}Postgres is already running on localhost:5432${NOCOLOR}.\n" 
  else 
    printf "${CYAN}Removing zombie postgres${NOCOLOR}.\n" 
    rm /usr/local/var/postgres/postmaster.pid 1>/dev/null 2>/dev/null
    printf "${CYAN}Restarting postgres${NOCOLOR}.\n" 
    brew services stop postgres 1>/dev/null 2>/dev/null
    brew services start postgres 1>/dev/null 2>/dev/null
  fi
} 

if [[ $1 == "pg" ]]
then 
  flush_pg
else 
  flush_rails
fi

