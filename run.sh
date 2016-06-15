#!/bin/bash

if [[ "$#" -ne 2 ]]; then
   echo "error: missing required argument."
   echo "syntax: ./run.sh <juju environment> <artifacts directory>"
   exit 1
fi

source /etc/bash_completion.d/virtualenvwrapper

rmvirtualenv bundletester
mkvirtualenv bundletester
source ~/.virtualenvs/bundletester/bin/activate
pip install bundletester junitxml python-subunit

juju_env=$1
export ARTIFACTS_DIRECTORY=$2

bundletester -v -l DEBUG -e $juju_env --no-destroy -r json -F -x keystone
