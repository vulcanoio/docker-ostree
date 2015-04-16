#!/bin/bash

repo=$(readlink -f $1)
image=$2
branch=$3

container=$(docker create $image /bin/false)

cmd="ostree -v commit -v --tar-autocreate-parents --tree=tar=<(cat) --subject $image --branch $branch"

docker export $container | docker run -i -v $repo:/ostree/repo resin/ostree "$cmd"

docker rm $container
