#!/bin/bash
#
# Perform check for V#######
#
# finding_vulnerability_id: V000000
# finding_title:  short name
# finding_category: CAT X
# finding_group: FUTURE_STUB
# 
# last_updated: James Montgomery 02/01/2014
#

RESULT="null"


evaluate() {
  RESULT="OPEN"
  echo "In evaluate() and here is the result: $RESULT"
} 


if [[ $BASH_SOURCE != $0 ]]; then
  evaluate 
  echo $RESULT >> ../results_file
else
  evaluate
  echo $RESULT
fi
 
