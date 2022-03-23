#!/usr/bin/env bash

dirs=(features/*/)

for dir in "${dirs[@]}" 
do
    cd $dir
    flutter pub get
    OUTPUT="$(flutter analyze)"
    echo "$OUTPUT"
    echo
    if grep -q "error •" <<< "$OUTPUT"; then
        echo "flutter analyze found errors"
        exit 1
    else
        echo "flutter analyze didn't find any errors"
        exit 0
    fi
    # flutter analyze
    # flutter format --dry-run --set-exit-if-changed .
    # flutter test --coverage
    # flutter test --machine >> test-results.json
    cd ../../
done