#!/usr/bin/env bash
DO_RAMDISK=0
if [[ $(grep 'ramDisk:' server-setup-config.yaml | awk 'BEGIN {FS=":"}{print $2}') =~ "yes" ]]; then
    SAVE_DIR=$(server.properties grep 'level-name' | awk 'BEGIN {FS="="}{print $2}')
    mv "$SAVE_DIR" "${SAVE_DIR}_backup"
    mkdir "$SAVE_DIR"
    sudo mount -t tmpfs -o size=2G tmpfs "$SAVE_DIR"
    DO_RAMDISK=1
fi
	if [ -f serverstarter-@@serverstarter-libVersion@@.jar ]; then
			echo "Skipping download. Using existing serverstarter-@@serverstarter-libVersion@@.jar"
         java -jar serverstarter-@@serverstarter-libVersion@@.jar
               if [[ $DO_RAMDISK -eq 1 ]]; then
               sudo umount "$SAVE_DIR"
               rm -rf "$SAVE_DIR"
               mv "${SAVE_DIR}_backup" "$SAVE_DIR"
               fi
               exit 0
	else
			export URL="https://github.com/TeamAOF/ServerStarter/releases/download/v@@serverstarter-libVersion@@/serverstarter-@@serverstarter-libVersion@@.jar"
	fi
		echo $URL
		if command -v wget>/dev/null 2>&1; then
			echo "DEBUG: (wget) Downloading ${URL}"
			wget -O serverstarter-@@serverstarter-libVersion@@.jar "${URL}"
   else
			if command -v curl>/dev/null 2>&1; then
				echo "DEBUG: (curl) Downloading ${URL}"
				curl -o serverstarter-@@serverstarter-libVersion@@.jar "${URL}"
			else
				echo "Neither wget or curl were found on your system. Please install one and try again"
         fi
      fi
java -jar serverstarter-@@serverstarter-libVersion@@.jar
if [[ $DO_RAMDISK -eq 1 ]]; then
    sudo umount "$SAVE_DIR"
    rm -rf "$SAVE_DIR"
    mv "${SAVE_DIR}_backup" "$SAVE_DIR"
fi
