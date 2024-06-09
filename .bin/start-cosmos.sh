#!/bin/bash

projectName="cosmos"
while getopts p: flag
do
    case "${flag}" in
        p) projectName=${OPTARG};;
    esac
done

cd /home/celestia

~/.bun/bin/bun apps/${projectName}/server.js