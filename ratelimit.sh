#!/bin/bash

# Example: Allow execution only once per second
INTERVAL=1 # Wait time in seconds
MAX_CALLS_PER_INTERVAL=1 # Maximum calls per interval (1 in this example)

COUNT=0
LAST_EXEC_TIME=$(date +%s) # Unix timestamp of the last execution

while true; do
    CURRENT_TIME=$(date +%s)
    ELAPSED_TIME=$((CURRENT_TIME - LAST_EXEC_TIME))

    if [ "$ELAPSED_TIME" -lt "$INTERVAL" ]; then
        # If less than 'INTERVAL' seconds have passed, wait
        SLEEP_TIME=$((INTERVAL - ELAPSED_TIME))
        echo "Waiting... ${SLEEP_TIME} seconds"
        sleep "$SLEEP_TIME"
    fi

    # Place your command to be executed here
    echo "Command executed at: $(date)"

    LAST_EXEC_TIME=$(date +%s)
    
    # Condition to break the loop for testing (remove in actual use)
    COUNT=$((COUNT + 1))
    if [ "$COUNT" -ge 5 ]; then
        break
    fi
done
