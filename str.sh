#!/usr/bin/env bash
###############################################################################
#      _        
#  ___| |_ _ __ 
# / __| __| '__|
# \__ \ |_| |   
# |___/\__|_|   
#               
################################################################################
# bashtools: Bash standard libraries
# ------------------------------------------------------------------------------
# Script:      str.sh
# Description: Bash funtions related to strings
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

#contains - DONE
#begins - DONE
#ends - DONE
#left
#right
#mid
#upper
#lower
#replace
#camelcase


str::contains() {
  local -r HAYSTACK=$1
  local -r NEEDLE=$2

  if [[ "${HAYSTACK}" =~ ^.*${NEEDLE}.*$ ]]; then
    return 0
  else
    return 1
  fi
}


str::begins() {
  local -r HAYSTACK=$1
  local -r NEEDLE=$2

  if [[ "${HAYSTACK}" =~ ^${NEEDLE}.*$ ]]; then
    return 0
  else
    return 1
  fi
}


str::ends() {
  local -r HAYSTACK=$1
  local -r NEEDLE=$2

  if [[ "${HAYSTACK}" =~ ^.*${NEEDLE}$ ]]; then
    return 0
  else
    return 1
  fi
}

str::replace {}
