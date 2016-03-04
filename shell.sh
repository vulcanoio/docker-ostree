#!/bin/bash

repo=$(readlink -f $1)

docker run -it --rm -v $repo:/ostree/repo resin/ostree /bin/bash
