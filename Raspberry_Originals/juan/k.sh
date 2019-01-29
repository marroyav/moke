#!/bin/bash

user="manuel"
psswd="0PLIlkOL"
port="22"
host="10.42.0.1"

echo `sshpass -p $psswd scp $user@$host:~/k/ads1256_test.c`
