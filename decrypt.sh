#!/usr/bin/env bash

read -s -p "Enter decryption password: " password
echo

check_password=$(openssl aes-256-cbc -d -a -pass "pass:$password" -in encrypted_text.txt 2>/dev/null)

if [ -z "$check_password" ]; then
    echo "Incorrect password. Decryption failed."
    exit 1
fi

decrypted_text=$(openssl aes-256-cbc -d -a -pass "pass:$password" -in encrypted_text.txt)

echo "Decrypted text: $decrypted_text"

