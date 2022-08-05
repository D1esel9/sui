#!/bin/bash
echo "-----------------------------------------------------------------------------"
echo "Выполняем обновление"
echo "-----------------------------------------------------------------------------"
sudo systemctl stop sui
rm -rf /home/ubuntu//.sui/db
wget -qO /home/ubuntu//.sui/genesis.blob https://github.com/MystenLabs/sui-genesis/raw/main/devnet/genesis.blob
cd /home/ubuntu//sui
git remote add upstream https://github.com/MystenLabs/sui
git fetch upstream
git stash
git checkout -B devnet --track upstream/devnet
echo "-----------------------------------------------------------------------------"
echo "Устанавливаем обновление"
echo "-----------------------------------------------------------------------------"
cargo build --release
sudo mv /home/ubuntu//sui/target/release/{sui,sui-node,sui-faucet} /usr/bin/
sudo systemctl restart sui
echo "-----------------------------------------------------------------------------"
echo "Обновление завершено"
echo "-----------------------------------------------------------------------------"
