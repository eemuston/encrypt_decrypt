#!/usr/bin/env bash

read -s -p "Enter encryption password: " password
echo

read -p "Enter text to encrypt: " input_text

encrypted_text=$(echo -n "$input_text" | openssl aes-256-cbc -a -salt -pass "pass:$password")

echo "$encrypted_text" > encrypted_text.txt

echo "Text encrypted successfully."
