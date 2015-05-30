#!/usr/bin/expect
spawn sudo -u postgres psql postgres
expect "postgres=# "
send "\\password postgres\r"
expect "Enter new password: "
send "postgres\r"
expect "Enter it again: "
send "postgres\r"
expect "postgres=# "
send "\\q\r"
expect "$ "