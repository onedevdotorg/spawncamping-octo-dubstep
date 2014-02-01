#!/bin/bash
#
# Perform check for V-
#
# last_updated: James Montgomery 02/01/2014
#


finding_result="Not Reviewed"
readonly finding_vulnerability_id="V-"
readonly finding_title=""
readonly finding_category="CAT "
readonly finding_group="FUTURE_STUB"

evaluate() {
  echo "hello world!"  
} 


if [[ $BASH_SOURCE != $0 ]]; then
  evaluate 
  echo "${finding_vulnerablity_id},${finding_result}" >> ../results_file.csv
else
  evaluate
  echo "${finding_vulnerability_id}: ${finding_result}"
fi
 
