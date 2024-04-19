#!/bin/bash

# Load the environment variables from the .env file
if [ -f .env ]; then
    export $(cat .env | xargs)
fi

# Run the ccminer-verus binary
ccminer-verus -a verus -o $MINING_POOL -u $WALLET_ADDRESS.$VERUS_USERNAME -p $VERUS_PASSWORD

