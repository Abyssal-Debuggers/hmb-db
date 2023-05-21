#!/bin/bash
SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
find $SCRIPTPATH/resources/ddl -name *.sql -print | sort -n | xargs -I {} psql -U postgres -f {}