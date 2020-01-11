# 
# "iPhone Distribution: Beijing Rongzhi Technology Co., Ltd. (58Y74FY8QK)"

function removePlug()
{
    rm -rf ./_CodeSignature
    rm -rf ./PlugIns
    rm -rf ./Watch
}

function codeSiginFramework()
{
    for file in ./*
    do
        if [[ "${file##*.}" = "framework" || "${file##*.}" = "dylib" ]]
        then
            echo $file
            codesign -fs "iPhone Developer: 泽 梁 (WVZ5JP3N7M)" $file
        else
            echo error呀
        fi
    done
}

function codesignApp()
{
    codesign -fs "iPhone Developer: 泽 梁 (WVZ5JP3N7M)" --no-strict --entitlements=Entitlements.plist kdweibo.app
}

#去到Payload文件夹下
function start()
{
    cp /Users/liangze/Documents/VSCode/ARM/Entitlements.plist ./ 
    #cd到app目录下
    cd ./kdweibo.app
    removePlug
    chmod +x kdweibo
    #修改plist的bundlerID
    new_bunlderId="com.fbbc.supi9"
    /usr/libexec/PlistBuddy -c "Set :CFBundleIdentifier ${new_bunlderId}" Info.plist

    CUSTOM_DISPLAY_NAME="哈哈哈"
    /usr/libexec/PlistBuddy -c "Set :CFBundleDisplayName ${CUSTOM_DISPLAY_NAME}" Info.plist
	/usr/libexec/PlistBuddy -c "Set :CFBundleName ${CUSTOM_DISPLAY_NAME}" Info.plist
    # cd ./Frameworks 文件夹
    cd ./Frameworks
    codeSiginFramework
    #cd 到Payload文件夹
    cd ../../
    codesignApp
}

start


codesign -fs "iPhone Distribution: Beijing Rongzhi Technology Co., Ltd. (58Y74FY8QK)" target.dylib

insert_dylib --weak --all-yes @executable_path/target.dylib TestOC

codesign -fs "Apple Distribution: Beijing Rongzhi Technology Co., Ltd. (58Y74FY8QK)" --no-strict --entitlements=../entitlements.plist ../TestOC.app 
xcrun -sdk iphoneos PackageApplication -v TestOC.app -o $(pwd)/TestOC.ipa