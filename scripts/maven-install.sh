#!/bin/sh

dd if=/dev/zero of=/media/mmcblk0p1/maven.img bs=2048 count=0 seek=1048742
apk add e2fsprogs
mkfs.ext4 /media/mmcblk0p1/maven.img
mount -a

export JAVA_HOME="/media/java/jvm/default-jvm"

export MAVEN_VERSION="3.5.3" \
MAVEN_HOME="/media/maven/home" \
PATH="/media/maven/home/bin:$JAVA_HOME/bin:$PATH"

apk --no-cache add --virtual build-dependencies wget && \
rm -rf "/media/maven/tmp" && \
mkdir "/media/maven/tmp" && \
cd "/media/maven/tmp" && \
wget -q "http://archive.apache.org/dist/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz" -O - | tar xzf - && \
mv "/media/maven/tmp/apache-maven-$MAVEN_VERSION" "/media/maven/home" && \
ln -s "/media/maven/home/maven/bin/mvn" "/usr/bin/mvn" && \
apk del --purge build-dependencies