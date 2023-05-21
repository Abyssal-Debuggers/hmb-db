#!/bin/bash

psql -U postgres -c 'create schema hmb;'
psql -U postgres -c 'create schema account;'