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

_BUFFER_=""

################################################################################
function buffer::add()
################################################################################
{
   _BUFFER_="${BUFFER}\n${1}"
}

################################################################################
function buffer::flush()
################################################################################
{
   buffer::get
   buffer::clean
}

################################################################################
function buffer::get()
################################################################################
{
   echo "${_BUFFER_}"
}

################################################################################
function buffer::clean()
################################################################################
{
   _BUFFER_=""
}
