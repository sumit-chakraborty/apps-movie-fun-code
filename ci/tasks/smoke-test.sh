#!/bin/bash

set -ex

if [ -z $ATTENDEE_SERVICE_URL ]; then
  echo "MOVIE_SERVICE_URL not set"
  exit 1
fi

pushd movie-fun-pipeline
  echo "Running smoke tests for Attendee Service deployed at $MOVIE_SERVICE_URL"
  apt-get update && apt-get install -y curl
  smoke-tests/bin/test $MOVIE_SERVICE_URL
popd



exit 0