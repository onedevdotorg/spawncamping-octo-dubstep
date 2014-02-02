#!/bin/bash
#
# Perform check for V-22343
#
# last_updated: James Montgomery 02/01/2014
#


finding_result="Not Reviewed"
readonly finding_vulnerability_id="V-22343"
readonly finding_title="The /etc/gshadow file must have mode 0400"
readonly finding_category="CAT II"
readonly finding_group="FUTURE_STUB"

evaluate() {
  file_permissions=$(stat -c "%a" /etc/gshadow)
  if [ ${file_permissions} != "400" ]; then
    finding_result="Open"
    if [ ${FIX} = "true" ]; then
      $(chmod 0400 /etc/gshadow)
      finding_result="Fixed"
    fi
  else
    finding_result="Not a Finding"
  fi
} 


if [[ $BASH_SOURCE != $0 ]]; then
  evaluate 
  echo "${finding_vulnerablity_id},${finding_result}" >> ../results_file.csv
else
  evaluate
  echo "${finding_vulnerability_id}: ${finding_result}"
fi
 
