#!/bin/bash
echo "-----------------------------------------------------------------------------"
sudo systemctl stop sui
sudo rm -rf /var/sui/db/* /var/sui/genesis.blob $HOME/sui
source $HOME/.cargo/env
cd $HOME
sudo git clone https://github.com/MystenLabs/sui.git
cd sui
sudo git remote add upstream https://github.com/MystenLabs/sui
sudo git fetch upstream
sudo git checkout -B devnet --track upstream/devnet
sudo cargo build --release
sudo mv ~/sui/target/release/sui-node /usr/local/bin/
sudo mv ~/sui/target/release/sui /usr/local/bin/
sudo wget -O /var/sui/genesis.blob https://github.com/MystenLabs/sui-genesis/raw/main/devnet/genesis.blob
sudo systemctl restart sui
echo "-----------------------------------------------------------------------------"
