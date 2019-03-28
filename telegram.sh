#!/bin/bash

if [ -n $BOT_API ];
then
URL="https://sourceforge.net/projects/pitchblack-twrp/files/"$NAME"/"$ZIP_NAME;

./telegram -t ${BOT_API} -c @pbtwrp -M "PitchBlack Recovery for LYF Water 8 (mobee01a)"$'\n'"Info"$'\n'"PitckBlack v2.9.0 Official"$'\n'"Based on TWRP 3.2.3"

MD5=`md5sum ${OUT}/$ZIP_NAME | awk '{ print $1 }'`
./telegram -t ${BOT_API} -c @pbtwrp -C "MD5: $MD5"$'\n\n'

./telegram -t ${BOT_API} -c @pbtwrp -M "Download: [Link](${URL})"$'\n\n'"Channel: @pbtwrp"$'\n'"Chat:@pbrpcom"

unset NAME;
unset BOT_API;


fi
