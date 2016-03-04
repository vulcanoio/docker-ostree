#!/bin/bash

repo=$(readlink -f $1)

cmd="ostree admin init-fs /"

docker run --rm -v $repo:/ostree/repo resin/ostree $cmd
