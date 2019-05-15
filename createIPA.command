#!/bin/bash
echo "==================MonkeyDev(create ipa file...)=================="
cd `dirname $0`;
dir=`dirname $0`
# /Users/liangze/Library/Developer/Xcode/DerivedData/i11-dixuahrblwrjjzcsorceugagroql/Build/Products/Debug-iphoneos
echo ${dir}
rm -rf ./Target.ipa;
rm -rf ./Payload; 
mkdir Payload; 
APP=$(find `dirname $0` -type d | grep ".app$" | head -n 1)
cp -rf "$APP" ./Payload; 
zip -r -q Target.ipa ./Payload; 
rm -rf ./Payload;
echo "==================MonkeyDev(done)=================="
exit;