#!/bin/bash

cp -r /usr/src/resources/pkglibdir/* "$(pg_config --pkglibdir)"
cp -r /usr/src/resources/sharedir/* "$(pg_config --sharedir)/extension"
