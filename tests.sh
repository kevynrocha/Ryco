#!/usr/bin/env bash

dirs=(features/*/)

for dir in "${dirs[@]}" 
do
    cd $dir
    echo "$dir"
    flutter pub get
    flutter analyze
    flutter test
    cd ../../
done