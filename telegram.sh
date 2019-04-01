#!/bin/bash

if [ -n $BOT_API ];
then
DEVICE=$(cut -d'_' -f2-3 <<<$TARGET_PRODUCT)
MODEL=$TARGET_DEVICE
VN=$TARGET_VENDOR
ZIP_NAME=$(basename "$ZIP_NAME")
URL="https://sourceforge.net/projects/pitchblack-twrp/files/"$NAME"/"$ZIP_NAME;
MD5=`md5sum ${OUT}/$ZIP_NAME | awk '{ print $1 }'`

$(pwd)/telegram -t ${BOT_API} -c @pbtwrp -M "PitchBlack Recovery for $VN $MODEL ($DEVICE)"$'\n'"Info"$'\n\n'"PitckBlack v2.9.0 Official"$'\n'"Based on TWRP 3.2.3"$'\n'"MD5: \`$MD5\`"$'\n\n'"Download: [Link](${URL})"$'\n\n'"Channel: @pbtwrp"$'\n'"Chat:@pbrpcom"

unset NAME;
unset BOT_API;


fi
