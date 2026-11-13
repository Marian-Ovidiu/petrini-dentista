#!/bin/sh
set -eu
cd "$(dirname "$0")"
if ! mysqladmin --no-defaults --socket="$PWD/runtime/mysql.sock" -uroot ping >/dev/null 2>&1; then
    mysqld --no-defaults --daemonize --skip-networking --datadir="$PWD/db" --socket="$PWD/runtime/mysql.sock" --pid-file="$PWD/runtime/mysql.pid" --log-error="$PWD/runtime/mysql.log"
fi
exec php -d sendmail_path=/usr/bin/false -S localhost:8765 -t site router.php
