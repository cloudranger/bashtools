#!/usr/bin/env bash

# trap errors with errexit set ???

#set -o errexit
set -o pipefail
set -o nounset
#set -o xtrace

source error.sh
source config.sh

config::insert test KEY1 1
config::insert test KEY2 2
status=$(config::insert test KEY1 1)
echo $status
    error::print
config::dump
echo "-------------------------------------------------"
config::dump


