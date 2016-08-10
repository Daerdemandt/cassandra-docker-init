#!/bin/bash

set -e # if something fails - the whole script fails

echo "Yay! It's working!"

cqlsh < /docker-entrypoint-init.d/init.cql

echo "Success!"
