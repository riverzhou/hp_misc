#!/bin/sh

pip3 list --format=legacy --outdated | cut -d " " -f 1 | xargs pip3 install -U


