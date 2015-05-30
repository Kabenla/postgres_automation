#!/usr/bin/expect
spawn createuser -U postgres -d -e -E -l -P -r -s vagrant -W
expect "Enter password for new role: " {send "vagrant\r"}
expect "Enter it again: " {send "vagrant\r"}
expect "Password: " {send "postgres\r"}
expect "$ " {send "exit\r"}