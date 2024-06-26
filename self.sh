#!/usr/bin/env bash
################################################################################
# bashtools: Bash standard libraries
# ------------------------------------------------------------------------------
# Script:      self.sh
# Description: Bash funtions related to the current script environment
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

self::scriptname() {
   echo "$(basename "$0")"
}


self::scriptpath() {
   echo "$(realpath "$0")"
}

