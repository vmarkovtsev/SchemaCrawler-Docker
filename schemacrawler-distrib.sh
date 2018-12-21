#!/bin/bash

# ## DISTRIBUTION
echo "Setting up SchemaCrawler distribution"

SCHEMACRAWLER_VERSION=15.03.02

# Download SchemaCrawler distribution
echo "Downloading SchemaCrawler distribution"
wget -nv https://github.com/schemacrawler/SchemaCrawler/releases/download/v"$SCHEMACRAWLER_VERSION"/schemacrawler-"$SCHEMACRAWLER_VERSION"-distribution.zip
unzip -q schemacrawler-"$SCHEMACRAWLER_VERSION"-distribution.zip 
mv schemacrawler-"$SCHEMACRAWLER_VERSION"-distribution/_distribution ./schemacrawler-distribution
rm -r schemacrawler-"$SCHEMACRAWLER_VERSION"-distribution
SC_DIR=`pwd`/schemacrawler-distribution

# Download additional libraries to allow SchemaCrawler commands to work
echo "Downloading additional libraries to support SchemaCrawler"
cd $SC_DIR
cd ./_downloader
chmod +x ./download.sh

./download.sh shell
./download.sh offline

./download.sh postgresql-embedded

./download.sh groovy
./download.sh python
./download.sh ruby

./download.sh velocity
./download.sh thymeleaf 

# Additional setup
echo "Performing additional setup of distribution"
cd $SC_DIR

rm ./_schemacrawler/lib/slf4j-jdk14-*.jar
cp ./examples/shell/schemacrawler-shell.* ./_schemacrawler
