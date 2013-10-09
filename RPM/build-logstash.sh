#!/bin/sh
version="1.2.1"
rm -rf BUILD RPMS SRPMS tmp || true
mkdir -p BUILD RPMS SRPMS

if [ ! -f SOURCES/logstash-$version-flatjar.jar ];
then
     wget "https://download.elasticsearch.org/logstash/logstash/logstash-1.2.1-flatjar.jar" -O SOURCES/logstash-$version-flatjar.jar
fi

rpmbuild -ba --target=noarch --define="_topdir $PWD" --define="_tmppath $PWD/tmp" --define="ver $version" SPECS/logstash.spec
