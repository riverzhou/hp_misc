#!/bin/sh

pip3 list --format=legacy --outdated | cut -d " " -f 1 


