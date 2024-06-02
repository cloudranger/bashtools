#!/usr/bin/env bash
###############################################################################
#  _ __  _   _ _ __ ___  
# | '_ \| | | | '_ ` _ \ 
# | | | | |_| | | | | | |
# |_| |_|\__,_|_| |_| |_|
#
###############################################################################
# bashtools: Bash standard libraries
# ------------------------------------------------------------------------------
# Script:      num.sh
# Description: Bash funtions related to numbers
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


###############################################################################
# Test if variable content is an integer
#
# Globals:
#    None
# Arguments:
#    VALUE to be tested
# Outputs:
#    Nothing
# Returns:
#    0 (success) when true
#    1 (failure) when false
###############################################################################

num::is_integer() {
  local -r VALUE="$1"

  if [[ "${VALUE}" =~ ^[0-9]*$ ]]; then
    return 0
  else
    return 1
  fi
}


###############################################################################
# Test if variable content is a float
#
# Globals:
#    None
# Arguments:
#    VALUE to be tested
# Outputs:
#    Nothing
# Returns:
#    0 (success) when true
#    1 (failure) when false
###############################################################################

num::is_float() {
  local -r VALUE="$1"

  if [[ "${VALUE}" =~ ^[0-9][0-9]*\.[0-9][0-9]*$ ]]; then
    return 0
  else
    return 1
  fi
}

