#!/usr/bin/env bash
# build the docker image

echo "================================================================================================="
echo "This script is only used during development to quickly deploy updates to a Canary/Dev cluster. "
echo "It is not called by the Jenkins. You should also not use it to patch or update a live cluster."
echo "================================================================================================="
echo ""

VERSION=v2-custom-base
# adding "_dev" to the project to avoid to affect negatively the PROD docker repository
PROJECT=cron-job
REPOSITORY=suti12



# causes the shell to exit if any subcommand or pipeline returns a non-zero status.
set -e

# set debug mode
#set -x


# build the new docker image
#
echo '>>> Building new image'
docker build -t my-custom-run-image-with-curl .  
pack builder create my-custom-builder --config builder.toml  
pack build $REPOSITORY/$PROJECT:$VERSION --buildpack paketo-buildpacks/nodejs --builder my-custom-builder --clear-cache --verbose
echo '>>> Push new image'
docker push $REPOSITORY/$PROJECT:$VERSION
