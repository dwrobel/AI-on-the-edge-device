#!/bin/bash

set -e

for f in config.ini ref0.jpg ref0_org.jpg ref1.jpg ref1_org.jpg reference.jpg; do
    rm -f $f
    wget http://esp32cam/fileserver/config/${f}
    git add $f
done

tfile=$(grep -A1 Digits config.ini | tail -n 1 | awk '{print $3}')

rm -f $(basename "${tfile}")

wget "http://esp32cam/fileserver/${tfile}"

git add $(basename "${tfile}")
