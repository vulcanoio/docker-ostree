#!/bin/bash

repo=$(readlink -f $1)
image=$2
branch=$3

container=$(docker create $image /bin/false)

cmd="LC_ALL=C.UTF-8 ostree -v commit -v --tar-autocreate-parents --tree=tar=<(cat) --subject $image --branch $branch"

docker export $container | docker run --rm -i -v $repo:/ostree/repo resin/ostree bash -c "$cmd"

docker rm $container
