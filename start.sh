#!/bin/sh

printf "$CONFIG" > config.toml

./rathole "${@}"