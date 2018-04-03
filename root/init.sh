#!/bin/sh

export JAVA_HOME="/media/java/jvm/default-jvm" \
MAVEN_HOME="/media/maven/home" \
PATH="/media/maven/home/bin:$JAVA_HOME/bin:$PATH"

ln -s "$JAVA_HOME/bin/"* "/usr/bin/" && \
ln -s "/media/maven/home/maven/bin/mvn" "/usr/bin/mvn"

/scripts/glibc-install.sh

