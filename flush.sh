#!/bin/bash

# kill lingering rails server
function flush {
	if [[ -f ./tmp/pids/server.pid ]]
	then
	  DEAD_PORT=$(<./tmp/pids/server.pid)
    
    if ps -p $DEAD_PORT | grep -q $DEAD_PORT 
    then 
      kill -9 $(<./tmp/pids/server.pid)
      echo "Removed server on port $DEAD_PORT." 
    else
      echo 'Server is aleady dead.'
    fi
	else
	  echo 'No server running in this directory.'
	fi
}

flush