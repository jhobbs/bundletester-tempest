#!/bin/bash

if [[ "$#" -ne 1 ]]; then
   echo "error: missing required argument."
   echo "syntax: ./run.sh <juju environment>"
   exit 1
fi

source /etc/bash_completion.d/virtualenvwrapper

rmvirtualenv bundletester
mkvirtualenv bundletester
source ~/.virtualenvs/bundletester/bin/activate
pip install bundletester --upgrade

juju_env=$1

#bundletester -v -l DEBUG -e $juju_env --no-destroy -r json -F -x keystone
