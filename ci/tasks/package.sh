#!/bin/bash

set -e +x

pushd movie-fun-pipeline
  echo "Packaging JAR"
  ./mvnw clean package -DskipTests
popd

jar_count=`find movie-fun-pipeline/target -type f -name *.jar | wc -l`

if [ $jar_count -gt 1 ]; then
  echo "More than one jar found, don't know which one to deploy. Exiting"
  exit 1
fi

find movie-fun-pipeline/target -type f -name *.jar -exec cp "{}" package-output/movie-service.jar \;

echo "Done packaging"
exit 0
