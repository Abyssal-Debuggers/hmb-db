#!/bin/bash
SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

pg_conftool set shared_preload_libraries "pg_uuidv7"

psql -U postgres -c 'create extension if not exists "pg_uuidv7";'