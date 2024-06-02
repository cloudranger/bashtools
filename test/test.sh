#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset
set -o xtrace

source ./config.sh

config::insert test KEY1 1
config::dump
