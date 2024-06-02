#!/usr/bin/env bash
################################################################################
# bashtools: Bash standard libraries
# -----------------------------------------------------------------------------
# Script:      user.sh
# Description: Bash funtions related to users
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

user::mustbe() {
   local -r user="$1"
   local -r msg="$2"    # Optional - will output this if present and user does not match
   local -r exit="$3"   # Optional - will exit with this value if present and user does not match

   local -r userid=$(id -u "$user")

   if [ "$(id -u)" -ne "${userid}" ]; then
      if [ -n "${msg}" ]; then
         echo "${msg}"
      fi

      if [ -n "${exit}" ]; then
         exit "${exit}"
      fi

      return 1
   fi

   return 0
}



