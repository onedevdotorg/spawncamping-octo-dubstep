#!/bin/bash
#
# Perform check for V-22344
#
# last_updated: James Montgomery 02/01/2014
#


finding_result="Not Reviewed"
readonly finding_vulnerability_id="V-22344"
readonly finding_title="The /etc/gshadow file must not have an extended ACL."
readonly finding_category="CAT II"
readonly finding_group="FUTURE_STUB"

evaluate() {
  file_acl=$(getfacl --skip-base /etc/gshadow)
  if [ -n "${file_acl}" ]; then
    finding_result="Open"
    if [ ${FIX} = "true" ]; then
      $(setfacl --remove-all /etc/gshadow)
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
