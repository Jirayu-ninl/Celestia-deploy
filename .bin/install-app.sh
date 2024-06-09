#!/bin/bash

projectName="cosmos"
while getopts p: flag
do
    case "${flag}" in
        p) projectName=${OPTARG};;
    esac
done

cd /home/celestia

rm -r apps/${projectName}
rm -r ${projectName}.7z

cd ..
sudo mv theiceji.com/app-${projectName}.7z celestia/app-${projectName}.7z

cd celestia
# unzip -o app-${projectName}.zip -d .
7z x app-${projectName}.7z
cp .env apps/${projectName}/
