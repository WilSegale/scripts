#/bin/bash

echo "whats your name"

read name

echo "how old are you"

read age

echo "hello $RANDOM you are $age"

echo "$PWD, $SHELL, $USER, $HOSTNAME, $Do, $ALL"

sleep 2

getrich$=$((( $RANDOM % 15 ) + $age ))

echo "$name, you will get rich at $getrich"
