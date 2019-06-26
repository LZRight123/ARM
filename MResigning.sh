
APP_BINARY=`plutil -convert xml1 -o - ./Info.plist|grep -A1 Exec|tail -n1|cut -f2 -d\>|cut -f1 -d\<`
PRODUCT_BUNDLE_IDENTIFIER="com.fbbc.supi10"
CUSTOM_DISPLAY_NAME="Demo"
# --------------------------------------
function removeAppExtensions(){
    # 为了是重签过程简化，移走extension和watchAPP. 此外个人免费的证书没办法签extension
    rm -rf "PlugIns"
    rm -rf "Watch"
}
# -------------------------------------

function modiflyInfoPlist(){
    /usr/libexec/PlistBuddy -c "Set :CFBundleIdentifier $PRODUCT_BUNDLE_IDENTIFIER" "Info.plist"
    
    /usr/libexec/PlistBuddy -c "Set :CFBundleDisplayName ${CUSTOM_DISPLAY_NAME}" "Info.plist"
	/usr/libexec/PlistBuddy -c "Set :CFBundleName ${CUSTOM_DISPLAY_NAME}" "Info.plist"
}

function modiflyBinPermission(){
    # 给可执行文件上权限
    chmod +x "$APP_BINARY"
}

function codesing(){
    TARGET_APP_FRAMEWORKS_PATH="Frameworks"
    if [ -d "$TARGET_APP_FRAMEWORKS_PATH" ];
    then
    #遍历出所有动态库的路径
    for FRAMEWORK in "$TARGET_APP_FRAMEWORKS_PATH/"*
    do
    # echo "🍺🍺🍺🍺🍺🍺FRAMEWORK : ${FRAMEWORK##./}"
    #签名
    /usr/bin/codesign --force --sign "$EXPANDED_CODE_SIGN_IDENTITY" "$FRAMEWORK"
    done
    fi
    #签名 app
}

function changeHookFileMachO(){
    frameworks=()
    # dylibs=(libdylib)
    dylibs=(libcycript libsubstrate libGuanggaoLanDylib)
    for fram in ${frameworks[@]}
    do
        /usr/local/bin/yololib "$APP_BINARY" "Frameworks/${fram}.framework/${fram}"
    done

    for dyli in ${dylibs[@]}
    do
        /usr/local/bin/yololib "$APP_BINARY" "${dyli}.dylib"
    done
   

}

function start()
{
    removeAppExtensions    
    modiflyInfoPlist
    modiflyBinPermission
    codesing
    changeHookFileMachO
    cd ../../
    zip -r Your.ipa Payload
}

start
# unzipAndCopyIpa
# rmFilterFramework
# zip -r Your.ipa Payload



