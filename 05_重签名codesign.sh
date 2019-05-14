function codeSiginFramework()
{
    # cd ./Frameworks 文件夹
    codesign -fs "iPhone Developer: 泽 梁 (WVZ5JP3N7M)" YZJEvent.framework
    codesign -fs "iPhone Developer: 泽 梁 (WVZ5JP3N7M)" Lottie.framework
    codesign -fs "iPhone Developer: 泽 梁 (WVZ5JP3N7M)" FLAnimatedImage.framework
    codesign -fs "iPhone Developer: 泽 梁 (WVZ5JP3N7M)" ExMasonry.framework
    codesign -fs "iPhone Developer: 泽 梁 (WVZ5JP3N7M)" ExCountly.framework
    codesign -fs "iPhone Developer: 泽 梁 (WVZ5JP3N7M)" Differentiator.framework
}

function testElement()
{
    for file in ./*.framework
    do
        if test -f $file
        then
           echo $file
        #应该这样就OK了
           codesign -fs "iPhone Developer: 泽 梁 (WVZ5JP3N7M)" $file
        else
           echo $file 不要.framework匹配是目录
        fi
    done
}

function codesignApp()
{
    #cd 到Payload文件夹
    cd ../../
    codesign -fs "iPhone Developer: 泽 梁 (WVZ5JP3N7M)" --no-strict --entitlements=Entitlements.plist kdweibo.app
}

codeSiginFramework
codesignApp