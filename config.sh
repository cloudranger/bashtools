#!/usr/bin/env bash
###############################################################################
#                    __ _       
#    ___ ___  _ __  / _(_) __ _ 
#   / __/ _ \| '_ \| |_| |/ _` |
#  | (_| (_) | | | |  _| | (_| |
#   \___\___/|_| |_|_| |_|\__, |
#                         |___/ 
###############################################################################
# bashtools: Bash standard libraries
# -----------------------------------------------------------------------------
# Script:      config.sh
# Description: Bash library of functions for managing simple config
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
# WARNING: Do not call these functions in a sub-shell as they maintain a global array

declare -A __config__
export __config__

function config::insert() {
  local -r ns=$1
  local -r key=$2
  local -r val=$3
  local -r idx=$(config::_mkidx "${ns}" "${key}")

  if [[ -v "__config__[${idx}]" ]]; then
    error::set "Failed to insert config value, array key (${idx}) already exists"
    return 1
  fi

  __config__[${idx}]="${val}"

  return 0
}



function config::update() {
  local -r ns=$1
  local -r key=$2
  local -r val=$3
  local -r idx=$(config::_mkidx "${ns}" "${key}")

  if [[ ! -v "__config__[${idx}]" ]]; then
    error::set "Failed to update config value, array key (${idx}) does not exist"
    return 1
  fi

  __config__["${idx}"]="${val}"

  return 0
}



function config::upsert() {
  local -r ns=$1
  local -r key=$2
  local -r val=$3
  local -r idx=$(config::_mkidx "${ns}" "${key}")

  __config__["${idx}"]="${val}"
}


function config::delete() {
  local -r ns=$1
  local -r key=$2
  local -r val=$3
  local -r idx=$(config::_mkidx "${ns}" "${key}")

  if [[ ! -v __config__["${idx}"] ]]; then
    error::set "Failed to delete config value, array key (${idx}) does not exist"
    error::print
    return 1
  fi

  unset "${__config__[${idx}]}"
}


function config::dump() {
  local key
  for key in "${!__config__[@]}"
  do
    echo "${key} ${__config__[${key}]}"
  done
}


function config::_mkidx() {
  local -r ns=$1
  local -r key=$2
  echo "${ns}__${key}"
}
