#!/bin/bash

psql -U postgres -c 'create extension if not exists "uuid-ossp";'