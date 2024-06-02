#!/usr/bin/env bash
###############################################################################
#   _                      
#  | |_ _ __ __ _  ___ ___ 
#  | __| '__/ _` |/ __/ _ \
#  | |_| | | (_| | (_|  __/
#   \__|_|  \__,_|\___\___|
#                          
###############################################################################
# bashtools: Bash standard libraries
# ------------------------------------------------------------------------------
# Script:      trace.sh
# Description: Bash library of functions for providing trace information
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

function trace::source() {
    local -r level=${1:-0}
    local -r caller=$(caller ${level})
    
    # shellcheck disable=SC2086 # Double quote to prevent globbing and word splitting.
    set ${caller}
    echo $3
}


function trace::function() {
    local -r level=${1:-0}
    local -r caller=$(caller ${level})
    
    # shellcheck disable=SC2086 # Double quote to prevent globbing and word splitting.
    set ${caller}
    echo $2
}


function trace::line() {
    local -r level=${1:-0}
    local -r caller=$(caller ${level})

    # shellcheck disable=SC2086 # Double quote to prevent globbing and word splitting.
    set ${caller}
    echo $1
}



# Print the current location (source, line, function)
# caller output is "line function source"
function trace::print() {
    local -r level=${1:-1}
    local -r caller=$(caller ${level})

    # shellcheck disable=SC2086 # Double quote to prevent globbing and word splitting.
    set ${caller}
    t::trace_line "$3" "$1" "$2" "${msg}" 
}


function trace::backtrace() {
    for (( x=0; x<((${#FUNCNAME[@]}-1)); x++ )); do
        t::trace_backtrace "${x}" "${BASH_SOURCE[((x+1))]}" "${BASH_LINENO[${x}]}" "${FUNCNAME[((x+1))]}"
        printf "\n"
    done
}




function trace::_test_() {
    sleep 0
}

