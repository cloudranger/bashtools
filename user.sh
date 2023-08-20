#!/usr/bin/env bash
################################################################################
# bashtools: Bash standard libraries
# ------------------------------------------------------------------------------
# Script:      user.sh
# Description: Bash funtions related to users
#
# Author:      cloudranger
# GitHub:      https://github.com/cloudranger
# License:     MIT
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
# The MIT License (MIT)
# Copyright © 2023 <copyright holders>
# 
# Permission is hereby granted, free of charge, to any person obtaining a 
# copy of this software and associated documentation files (the “Software”), 
# to deal in the Software without restriction, including without limitation the 
# rights to use, copy, modify, merge, publish, distribute, sublicense, and/or 
# sell copies of the Software, and to permit persons to whom the Software is 
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in 
# all copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR 
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE 
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, 
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN 
# THE SOFTWARE.
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



