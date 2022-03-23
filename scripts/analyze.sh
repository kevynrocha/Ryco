#!/usr/bin/env bash

cd ../features/feature_login/

flutter analyze
# echo
# if grep -q "info" <<< "$OUTPUT"; then
#     echo "flutter analyze found errors"
#     exit 1
# else
#     echo "flutter analyze didn't find any errors"
#     exit 0
# fi