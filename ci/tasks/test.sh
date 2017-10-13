#!/bin/bash

set -ex

pushd movie-fun-pipeline
  echo "Fetching Dependencies"
  ./mvnw clean compile > /dev/null

  echo "Running Tests"
  ./mvnw test
popd

exit 0