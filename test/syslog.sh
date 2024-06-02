#!/usr/bin/env bash

source ../syslog.sh
source ../assert.sh

#set -o errexit
set -o pipefail
set -o nounset
#set -o xtrace

assert::stop_on_error 0

#--- Check that a syslog record is written to /var/log/syslog
msg="BASHTOOLS syslog::log TEST $$.$(date -Iseconds)"
syslog::log user.info "${msg}"
result=$(grep "${msg}" /var/log/syslog)
assert::notempty "${result}" "Check for syslog output to /var/log/syslog"


#--- Check that a syslog record is written to stderr
msg="BASHTOOLS syslog::stderr TEST $$.$(date -Iseconds)"
result=$(syslog::stderr user.info "${msg}" 2>&1 >/dev/null)
assert::contains "${msg}" "${result}" "Check for syslog output to stderr"


assert::eq 1 1 "1=1"
assert::eq 1 2 "1=2"
assert::eq "1" "1" "'1'='1'"
assert::eq "1" "2" "'1'='2'"
assert::eq 1 "1" "1='1'"
