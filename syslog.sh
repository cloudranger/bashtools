#!/usr/bin/env bash
###############################################################################
#                 _             
#   ___ _   _ ___| | ___   __ _ 
#  / __| | | / __| |/ _ \ / _` |
#  \__ \ |_| \__ \ | (_) | (_| |
#  |___/\__, |___/_|\___/ \__, |
#       |___/             |___/ 
# 
###############################################################################
# Bash library of syslog functions
# Author: cloudranger 
# Date:   22.01.2022
#
# Follow this styleguide:
# https://google.github.io/styleguide/shellguide.html
###############################################################################


function syslog::_stdmsg_() {
   priority="$1"
   msg="$2"
   echo "$(date -Is): $(hostname) ${priority} $(basename "${0}"): ${msg}"
}


function syslog::log() {
   priority="$1"
   msg="$2"

   logger -p "${priority}" "$(syslog::_stdmsg_ "${priority}" "${msg}")"
}


function syslog::stderr() {
   priority="$1"
   msg="$2"

   logger --stderr -p "${priority}" "$(syslog::_stdmsg_ "${priority}" "${msg}")"
}
