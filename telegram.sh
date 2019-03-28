#!/bin/bash

if [ -n $BOT_API ];
then
ZIP_NAME=$(basename "$ZIP_NAME")
URL="https://sourceforge.net/projects/pitchblack-twrp/files/"$NAME"/"$ZIP_NAME;

$(pwd)/telegram -t ${BOT_API} -c @pbtwrp -M "PitchBlack Recovery for LYF Water 8 (mobee01a)"$'\n'"Info"$'\n\n'"PitckBlack v2.9.0 Official"$'\n'"Based on TWRP 3.2.3"

MD5=`md5sum ${OUT}/$ZIP_NAME | awk '{ print $1 }'`
$(pwd)/telegram -t ${BOT_API} -c @pbtwrp -C "MD5: $MD5"$'\n\n'

$(pwd)/telegram -t ${BOT_API} -c @pbtwrp -M "Download: [Link](${URL})"$'\n\n'"Channel: @pbtwrp"$'\n'"Chat:@pbrpcom"

unset NAME;
unset BOT_API;


fi
