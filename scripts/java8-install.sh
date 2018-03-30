#!/bin/sh

dd if=/dev/zero of=/media/mmcblk0p1/java.img bs=2048 count=1
apk add e2fsprogs
mkfs.ext4 /media/mmcblk0p1/java.img
mount -a

export JAVA_VERSION=8 \
JAVA_UPDATE=161 \
JAVA_BUILD=12 \
JAVA_PATH=2f38c3b165be4555a1fa6e98c45e0808 \
JAVA_HOME="/media/java/jvm/default-jvm"

apk add --no-cache --virtual=build-dependencies wget ca-certificates unzip && \
mkdir "/media/java/tmp" && \
cd "/media/java/tmp" && \
wget --header "Cookie: oraclelicense=accept-securebackup-cookie;" \
    "http://download.oracle.com/otn-pub/java/jdk/${JAVA_VERSION}u${JAVA_UPDATE}-b${JAVA_BUILD}/${JAVA_PATH}/jdk-${JAVA_VERSION}u${JAVA_UPDATE}-linux-x64.tar.gz" && \
tar -xzf "jdk-${JAVA_VERSION}u${JAVA_UPDATE}-linux-x64.tar.gz" && \
mkdir -p "/media/java/jvm" && \
mv "/media/java/tmp/jdk1.${JAVA_VERSION}.0_${JAVA_UPDATE}" "/media/java/jvm/java-${JAVA_VERSION}-oracle" && \
ln -s "java-${JAVA_VERSION}-oracle" "$JAVA_HOME" && \
ln -s "$JAVA_HOME/bin/"* "/usr/bin/" && \
rm -rf "$JAVA_HOME/"*src.zip && \
rm -rf "$JAVA_HOME/lib/missioncontrol" \
       "$JAVA_HOME/lib/visualvm" \
       "$JAVA_HOME/lib/"*javafx* \
       "$JAVA_HOME/jre/lib/plugin.jar" \
       "$JAVA_HOME/jre/lib/ext/jfxrt.jar" \
       "$JAVA_HOME/jre/bin/javaws" \
       "$JAVA_HOME/jre/lib/javaws.jar" \
       "$JAVA_HOME/jre/lib/desktop" \
       "$JAVA_HOME/jre/plugin" \
       "$JAVA_HOME/jre/lib/"deploy* \
       "$JAVA_HOME/jre/lib/"*javafx* \
       "$JAVA_HOME/jre/lib/"*jfx* \
       "$JAVA_HOME/jre/lib/amd64/libdecora_sse.so" \
       "$JAVA_HOME/jre/lib/amd64/"libprism_*.so \
       "$JAVA_HOME/jre/lib/amd64/libfxplugins.so" \
       "$JAVA_HOME/jre/lib/amd64/libglass.so" \
       "$JAVA_HOME/jre/lib/amd64/libgstreamer-lite.so" \
       "$JAVA_HOME/jre/lib/amd64/"libjavafx*.so \
       "$JAVA_HOME/jre/lib/amd64/"libjfx*.so && \
wget --header "Cookie: oraclelicense=accept-securebackup-cookie;" \
    "http://download.oracle.com/otn-pub/java/jce/${JAVA_VERSION}/jce_policy-${JAVA_VERSION}.zip" && \
unzip -jo -d "${JAVA_HOME}/jre/lib/security" "jce_policy-${JAVA_VERSION}.zip" && \
rm "${JAVA_HOME}/jre/lib/security/README.txt" && \
apk del build-dependencies
#rm "/media/java/tmp/*"

