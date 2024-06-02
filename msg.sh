#!/usr/bin/env bash
################################################################################
#
#  _ __ ___  ___  __ _ 
# | '_ ` _ \/ __|/ _` |
# | | | | | \__ \ (_| |
# |_| |_| |_|___/\__, |
#                |___/ 
#
################################################################################
# bashtools: Bash standard libraries
# ------------------------------------------------------------------------------
# Script:      msg.sh
# Description: Bash funtions related to messaging/logging
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

msg::out() {
   priority=$1
   msg=$2

   local out

   out="$(date -Is): $(hostname) ${priority} ${0}: ${msg}"
   echo "${out}"
}
