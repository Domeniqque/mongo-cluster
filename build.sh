#!/bin/bash

git rev-parse --abbrev-ref HEAD
git fetch --all --tags --prune --force

LATEST_VERSION=`git tag --sort=taggerdate | tail -1`
read -p "Qual versão do deploy ($LATEST_VERSION): " VERSION
VERSION=${VERSION:-$LATEST_VERSION}

# git checkout tags/$VERSION

docker build -t registry.tce.ro.gov.br/mongo-cluster-setup:$VERSION .
docker push registry.tce.ro.gov.br/mongo-cluster-setup:$VERSION
