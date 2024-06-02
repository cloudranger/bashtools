#!/bin/env bash
# lxdfuncs

trap '_error_ $? $LINENO' ERR


################################################################################
function _error_
################################################################################
{
   ERRNO=$1
   LINE=$2
   printf "Error %s at line %d\n" "${ERRNO}" "${LINE}"

   local i=0
   local line_no
   local function_name
   local file_name
   while caller $i ;do ((i++)) ; done | while read -r line_no function_name file_name;do echo -e "\t$file_name:$line_no\t$function_name" ;done >&2
}



################################################################################
function _log_
################################################################################
(
   local LOGLEVEL=$1
   if [ "${LOGLEVEL}" -gt "${VAR[DEBUG]}" ]; then
      return
   fi

   local FUNC=$2
   shift
   shift
   local MSG="$*"
   local DATE
   DATE=$(date --rfc-3339=ns)

   if [ "${VAR[LOG_TIMESTAMP]}" == 1 ]; then
      printf "%s " "${DATE}"
   fi

   if [ "${VAR[LOG_LOGLEVEL]}" == 1 ]; then
      printf "%s " "{$LOGLEVEL}"
   fi

   if [ "${VAR[LOG_FUNCTION]}" == 1 ]; then
      printf "%s " "($FUNC)"
   fi

   printf "%s\n" "${MSG}"
)


################################################################################
function _exit_
################################################################################
{
   local VALUE=$1
   local FUNC=$2
   local MSG=$3

   _log_ 0 "${FUNC}" "${MSG}"
   exit "${VALUE}"
}


###############################################################################
function _replace_
###############################################################################
{
   local HAYSTACK=$1
   local NEEDLE=$2
   local REPLACE=$3
   echo "${HAYSTACK//$NEEDLE/$REPLACE}"
}


###############################################################################
function _isinteger_
###############################################################################
(
   if [[ "${VALUE}" =~ ^[0-9]*$ ]]; then
      echo 1
   else
      echo 0
   fi
)

