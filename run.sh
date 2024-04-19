#!/usr/bin/with-contenv bashio

echo "Verus Coin Miner."
echo ""

USERNAME=$(bashio::config 'username')
WALLET_ADDRESS=$(bashio::config 'wallet_address')
MINING_POOL=$(bashio::config 'mining_pool')
VERUS_PASSWORD=$(bashio::config 'verus_password')

echo "Wallet address is: " $WALLET_ADDRESS
echo "Mining pool is: " $MINING_POOL
echo "Username is: " $USERNAME
echo "Password is: " $VERUS_PASSWORD

echo "Run ccminer-verus . . ."
ccminer-verus -a verus -o $MINING_POOL -u $WALLET_ADDRESS.$USERNAME -p $VERUS_PASSWORD
