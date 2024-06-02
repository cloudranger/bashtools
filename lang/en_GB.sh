#!/usr/bin/env bash
###############################################################################
#                  ____ ____  
#    ___ _ __     / ___| __ ) 
#   / _ \ '_ \   | |  _|  _ \ 
#  |  __/ | | |  | |_| | |_) |
#   \___|_| |_|___\____|____/ 
#            |_____|          
#
###############################################################################
# Language file en_GB
# Author: cloudranger 
# Date:   22.01.2022
#
# Follow this styleguide:
# https://google.github.io/styleguide/shellguide.html
#
# For language files name the function t::xxxxxxxxx
###############################################################################

function t::error_errorline()   { printf "Error in %s line %d in %s: %s" "$1" "$2" "$3" "$4"; }

function t::trace_line()        { printf "%s line %d in %s" "$1" "$2" "$3"; }
function t::trace_backtrace()   { printf "[%d] %s line %d in %s" "$1" "$2" "$3" "$4"; }

