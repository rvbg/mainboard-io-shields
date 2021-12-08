#!/bin/bash

# Simple standardized output from scad to png and stl.

openscad $1.scad -o $1.stl \
        --export-format binstl

openscad $1.scad -o $1.png \
        --imgsize 2160,2160 \
        --colorscheme DeepOcean \
        --render \
        --viewall