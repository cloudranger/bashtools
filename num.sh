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

