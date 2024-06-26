#!/usr/bin/env bash
################################################################################
#                          _   
#   __ _ ___ ___  ___ _ __| |_ 
#  / _` / __/ __|/ _ \ '__| __|
# | (_| \__ \__ \  __/ |  | |_ 
#  \__,_|___/___/\___|_|   \__|
#                              
################################################################################
# bashtools: Bash standard libraries
# ------------------------------------------------------------------------------
# Script:      assert.sh
# Description: Bash funtions related to unit testing/assertion
#
# Author:      cloudranger
# GitHub:      https://github.com/cloudranger
# License:     MIT (see file LICENSE)
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

#assert::gt
#assert::ge
#assert::lt
#assert::le
#assert::true
#assert::false
#assert::empty
#assert::contains

_BASHTOOLS_ASSERT_STOP=0
_BASHTOOLS_ASSERT_VERBOSE=1


function assert::stop_on_error() {
  _BASHTOOLS_ASSERT_STOP=$1
#validate
  echo "Assert: INFO: Stop on error: ${_BASHTOOLS_ASSERT_STOP}"
}


function assert::verbose() {
  _BASHTOOLS_ASSERT_VERBOSE=$1
#validate
  echo "Assert: INFO: Verbose: ${_BASHTOOLS_ASSERT_VERBOSE}"
}


function assert::fail() {
  local -r msg=$1

  printf "%s" "Assert: FAIL: $msg"
  if (( "${_BASHTOOLS_ASSERT_VERBOSE}" )); then
    printf " %s" "[$(trace::print 2)]"
  fi
  printf "\n"
  
  if (( "${_BASHTOOLS_ASSERT_STOP}" )); then
    echo "Assert: STOP: Stop on fail"
    exit 1
  fi
  
  return 1
}


function assert::pass() {
  local -r msg=$1

  printf "%s" "Assert: PASS: $msg"
  if (( "${_BASHTOOLS_ASSERT_VERBOSE}" )); then
    printf " [%s]" "$(trace::print 2)"
  fi
  printf "\n"

  return 0
}


function assert::explain() {
  local -r msg=$1

  echo "$msg"
  return 0
}


###############################################################################
# Test if both sides are equal
#
# Globals:
#    None
# Arguments:
#    1. expected value
#    2. actual value
# Outputs:
#    Nothing
# Returns:
#    0 (success) when true
#    1 (failure) when false
###############################################################################


function assert::eq() {
  local -r expect=$1
  local -r actual=$2
  local -r msg=$3

  local -r caller=$(caller)
  local status=0

  if [[ "${expect}" == "${actual}" ]]; then
    assert::pass "${msg}"
    return 0
  else
    assert::fail "${msg}"
    if (( "${_BASHTOOLS_ASSERT_VERBOSE}" )); then
      assert::explain "${expect} != ${actual}"
    fi
    return 1
  fi
}



function assert::neq() {
  local -r expect=$1
  local -r actual=$2
  local -r msg=$3

  if [[ $(assert::eq "${expect}" "${actual}" "${msg}") ]]; then
    assert::pass "${msg}" 
    return 1
  else
    assert::fail "${msg}"
    return 0
  fi
}


function assert::empty() {
  local -r expect=$1
  local -r msg=$2

  if [[ -z "${expect}" ]]; then
    assert::pass "${msg}"  
    return 0
  else
    assert::fail "${msg}" 
    return 1
  fi
}


function assert::notempty() {
  local -r expect=$1
  local -r msg=$2

  if [[ -n "${expect}" ]]; then
    assert::pass "${msg}" 
    return 0
  else
    assert::fail "${msg}" "${caller}"
    if (( "${_BASHTOOLS_ASSERT_VERBOSE}" )); then
      assert::explain "Value (${expect}) is empty"
    fi
    return 1
  fi
}


function assert::contains() {
  local -r needle=$1
  local -r haystack=$2
  local -r msg=$3

  if [[ "${haystack}" == *${needle}* ]]; then
    assert::pass "${msg}"
    return 0
  else
    assert::fail "${msg}"
    if (( "${_BASHTOOLS_ASSERT_VERBOSE}" )); then
      assert::explain "needle not found in haystack"
      assert::explain "needle: ${needle}"
      assert::explain "haystack: ${haystack}"
    fi
    return 1
  fi
}


function assert::notcontains() {
  local -r needle=$1
  local -r haystack=$2
  local -r msg=$3

  if [[ "${haystack}" == *${needle}* ]]; then
    assert::fail "${msg}"
    if (( "${_BASHTOOLS_ASSERT_VERBOSE}" )); then
      assert::explain "needle found in haystack (should not be)"
      assert::explain "needle: ${needle}"
      assert::explain "haystack: ${haystack}"
    fi
    return 1
  else
    assert::pass "${msg}"
    return 0
  fi
}



function assert::fails() {
  local -r status=$1
  local -r msg=$2

  if (( "${status}" )); then
    assert::pass "${msg}"
    return 0
  fi

  return 1
}


function assert::passes() {
  local -r status=$1
  local -r msg=$2

  if (( "${status}" )); then
    assert::pass "${msg}"
    return 0
  fi

  return 1
}


function assert::true() {
  return 1
}

function assert::false() {
  return 0
}


function assert::_test_() {

  assert::stop_on_error 0

  assert::contains "Assert: PASS: test01"  "$(assert::pass "test01")"  "Check that assert::pass outputs the correct string"  
  assert::contains "Assert: FAIL: test02"  "$(assert::fail "test02")"  "Check that assert::fail outputs the correct string"  

  assert::eq "test02" "test02" "assert::eq positive test"
  assert::neq "test03" "test03x" "assert::neq positive test" 
  assert::empty "" "assert::empty positive test" 
  assert::notempty     "test05"                "assert::notempty positive test" 
  assert::contains     "test06"  "XXtest06XX"  "assert::contains positive test" 
  assert::notcontains  "test07"  "XXX"         "assert::notcontains positive test" 

  #assert::fails $(assert::empty "xxx" "assert::empty negative test")

  return 0
}
