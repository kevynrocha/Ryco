#!/usr/bin/env bash

dirs=(features/*/)

for dir in "${dirs[@]}" 
do
    cd $dir
    flutter pub get
    # flutter analyze
    # flutter format --dry-run --set-exit-if-changed .
    # flutter test --coverage
    # flutter test --machine >> test-results.json
    cd ../../
done