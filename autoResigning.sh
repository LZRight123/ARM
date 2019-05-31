# ${SRCROOT} 这个是工程目录
echo ${SRCROOT}
echo ${SRCROOT}
TEMP_PATH="${SRCROOT}/Temp"
# 资源文件夹
ASSETS_PATH="${SRCROOT}/APP"
# ipa包路径
TARGET_IPA_PATH="${ASSETS_PATH}/*.ipa"
# 新包路径
NewTargetPath="${SRCROOT}/NewTarget"
#新建Temp文件夹
rm -rf "${TEMP_PATH}"
# mkdir -p "${TEMP_PATH}"
rm -rf "${NewTargetPath}"
mkdir -p "${NewTargetPath}"

# --------------------------------------
function unzipAndCopyIpa(){
    # 解压IPA 到Temp下
    # 解压ipa包到Temp目录
    # unzip -oqq "$TARGET_IPA_PATH" -d "$TEMP_PATH"
    # 拿到解压的临时App的路径
    TEMP_APP_PATH=$(set -- "$TEMP_PATH/Payload/"*.app;echo "$1")
    # 打印一下
    echo "解压的app路径🍺🍺🍺🍺🍺🍺:$TEMP_APP_PATH"

    #把解压出来的.app拷贝到工程目录
    #BUILT_PRODUCTS_DIR 工程生成的APP包路径
    # BUILT_PRODUCTS_DIR=/Users/liangze/Library/Developer/Xcode/DerivedData/pgysdk-gzekcjwvhwzhvchfoybsppkdwtiy/Build/Products/Debug-iphoneos
    #TARGET_NAME target名称
    TARGET_APP_PATH="$BUILT_PRODUCTS_DIR/$TARGET_NAME.app"
    echo "build工程路径🍺🍺🍺🍺🍺🍺:$TARGET_APP_PATH"
    
    # rm -rf "$TARGET_APP_PATH"
    rmFilterFramework "$TARGET_APP_PATH"
    mkdir -p "$TARGET_APP_PATH"
    cp -rf "$TEMP_APP_PATH/" "$TARGET_APP_PATH/"
}

function rmFilterFramework(){
    #删除工程目录下的framework
    #echo `pwd` 这里是在工程目录下  /Users/liangze/Desktop/砸壳的APPS/ReverCodeSigning
    echo `ls $1`
    for element in `ls $1`
    do
        if  test "$element" == "Frameworks" || test "$element" == "*.framewrok" || test "$element" == "*.dylib"; then
            echo ======
            else
            rm -rf $1"/"$element
        fi
    done
}


function removeAppExtensions(){
    # 为了是重签过程简化，移走extension和watchAPP. 此外个人免费的证书没办法签extension
    rm -rf "$TARGET_APP_PATH/PlugIns"
    rm -rf "$TARGET_APP_PATH/Watch"
}
# -------------------------------------

function modiflyInfoPlist(){
    /usr/libexec/PlistBuddy -c "Set :CFBundleIdentifier $PRODUCT_BUNDLE_IDENTIFIER" "$TARGET_APP_PATH/Info.plist"
    
    CUSTOM_DISPLAY_NAME=$(/usr/libexec/PlistBuddy -c "Print CFBundleDisplayName"  "${SRCROOT}/$TARGET_NAME/Info.plist")
    echo "function=>modiflyInfoPlist=>${CUSTOM_DISPLAY_NAME}"
    /usr/libexec/PlistBuddy -c "Set :CFBundleDisplayName ${CUSTOM_DISPLAY_NAME}" "$TARGET_APP_PATH/Info.plist"
	/usr/libexec/PlistBuddy -c "Set :CFBundleName ${CUSTOM_DISPLAY_NAME}" "$TARGET_APP_PATH/Info.plist"
}

function modiflyBinPermission(){
    # 给可执行文件上权限
    #添加ipa二进制的执行权限,否则xcode会告知无法运行
    #这个操作是要找到第三方app包里的可执行文件名称，因为info.plist的 'Executable file' key对应的是可执行文件的名称
    #我们grep 一下,然后取最后一行, 然后以cut 命令分割，取出想要的关键信息。存到APP_BINARY变量里
    APP_BINARY=`plutil -convert xml1 -o - $TARGET_APP_PATH/Info.plist|grep -A1 Exec|tail -n1|cut -f2 -d\>|cut -f1 -d\<`
    #这个为二进制文件加上可执行权限 +X
    chmod +x "$TARGET_APP_PATH/$APP_BINARY"
}

function codesing(){
    TARGET_APP_FRAMEWORKS_PATH="$TARGET_APP_PATH/Frameworks"
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
    frameworks=(Framework1)
    # dylibs=(libdylib)
    dylibs=()
    for fram in ${frameworks[@]}
    do
        /usr/local/bin/yololib "$TARGET_APP_PATH/$APP_BINARY" "Frameworks/${fram}.framework/${fram}"
    done

    for dyli in ${dylibs[@]}
    do
        /usr/local/bin/yololib "$TARGET_APP_PATH/$APP_BINARY" "${dyli}.dylib"
    done
   

}

function start()
{
    # env > /Users/liangze/Documents/VSCode/ARM/autoResigningEnvPath.md
    unzipAndCopyIpa
    removeAppExtensions
    modiflyInfoPlist
    modiflyBinPermission
    codesing
    changeHookFileMachO

    cp -rf "${TARGET_APP_PATH}" "${SRCROOT}/NewTarget"
}

start
# rmFilterFramework
# zip -r Your.ipa Payload



