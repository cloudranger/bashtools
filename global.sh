#!/usr/bin/env bash
################################################################################
#
#
################################################################################
# bashtools: Bash standard libraries
# ------------------------------------------------------------------------------
# Script:      ...
# Description: Bash funtions related to ...
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

declare -A BASHTOOLS_GLOBALS


function global::define() {
    trace::source 1
    trace::function 1
    trace::line 1

    BASHTOOLS_GLOBALS["$1"]=""
}


function global::set() {
    if var::defined "$1" verbose; then
        BASHTOOLS_GLOBALS["$1"]="$2"
    fi
}


function global::unset() {
    if var::defined "$1" verbose; then
        "${BASHTOOLS_GLOBALS[@]/"$1"}"
    fi
}


function global::get() {
    if var::defined "$1" verbose; then
        echo "${BASHTOOLS_GLOBALS["$1"]}"
    fi
}


function global::inc() {
    if var::defined "$1" verbose; then
        ((BASHTOOLS_GLOBALS["$1"]++))
    fi
}


function global::dec() {
    if var::defined "$1" verbose; then
        ((BASHTOOLS_GLOBALS["$1"]--))
    fi
}


function global::defined() {
    local -r verbose="$2"
    
    if [[ -v BASHTOOLS_GLOBALS["$1"] ]]; then
        return status::SUCCESS
    else
        if [[ -n "${verbose}" ]]; then
            echo "var $1 is not defined, try var::define $1"
        fi
        return status::FAILURE
    fi
}


function global::test() {
    var::define x
    var::define y
        var::set x 5
        var::set y 1
        var::inc x
        var::inc y
}

