#!/bin/bash

cd /home/celestia

sudo rm -r apps/cosmos
sudo rm -R tmp
mkdir tmp
sudo wget -i app-cosmos.txt -P tmp

cd tmp
cat celestia-cosmos.z01 celestia-cosmos.z02 celestia-cosmos.zip > celestia-cosmos-merge.zip

cd ..
unzip -o celestia-cosmos-merge.zip -d .
sudo cp .env apps/cosmos/
