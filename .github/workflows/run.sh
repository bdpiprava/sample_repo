#!/bin/sh

value="$1"

echo "Run id is $value";

if [ $((value%2)) -eq 0 ];then
    echo "Failing the job";
    exit 1;
else
    echo "Success";
fi