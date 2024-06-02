#!/usr/bin/env bash
################################################################################
#
#
################################################################################
# bashtools: Bash standard libraries
# ------------------------------------------------------------------------------
# Script:      error.sh
# Description: Bash library of functions for error handling
#
# Author:      cloudranger
# GitHub:      https://github.com/cloudranger
# License:     MIT (See file LICENSE)
# Created:     15.08.2023
#
# CODING STANDARDS
# Use Google shell style guide
# https://google.github.io/styleguide/shellguide.html
#
# SYNTAX CHECKING
# Use shellcheck 
# Debian:  sudo apt install shellcheck   
# Ubuntu:  sudo apt install shellcheck   
# FreeBSD: sudo pkg install hs_Shellcheck
#
# UNIT TESTS
# Use bats-core
# https://github.com/bats-core/bats-core
#
################################################################################

declare BASHTOOLS_ERRMSG

function error::trap() {
    local -r status=${1:-1}

    if [[ "${status}" ]]; then
        trap 'error::handler' ERR
    fi
}

function error::handler() {
    echo "***error handler***"
    error::backtrace ""  # what message ?
}

# Print the current location (source, line, function)
# caller output is "line function source"

function error::print() {
    error::set "$1"  # msg
    printf "%s" "${BASHTOOLS_ERRMSG}"
}



function error::backtrace() {
    local -r msg=${1:-""}

    error::set "${msg}"
    printf "%s\n" "${BASHTOOLS_ERRMSG}"
    trace::backtrace 
}


# Generates an error message and saves it to a global location
# This is used by functions that want to return a status code when an error occurs
# and would like the calling code to have access to an error message related to the status code

function error::set() {
  local -r msg=$1
  local -r caller=$(caller 1)

  # shellcheck disable=SC2086 # Double quote to prevent globbing and word splitting.
  set ${caller}
  printf -v BASHTOOLS_ERRMSG "%s" "$(t::error_errorline "$3" "$1" "$2" "${msg}")"
  return 0
}


# Used with error::set to retrieve the last error message

function error::get() {
  echo "${BASHTOOLS_ERRMSG}"
}


###############################################################################
#   _            _       
#  | |_ ___  ___| |_ ___ 
#  | __/ _ \/ __| __/ __|
#  | ||  __/\__ \ |_\__ \
#   \__\___||___/\__|___/
#                        
###############################################################################

function error::_test_() {
    assert::contains "test01" "$(error::print "test01")"       "error::print returns the correct string"
    assert::contains "test02" "$(error::backtrace "test02")"   "error::backtrace returns the correct string"

    error::set "test03"
    assert::contains "test03" "$(error::get)" "error::set and error::get work correctly"
}
