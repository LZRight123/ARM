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

function codesignApp()
{
    #cd 到Payload文件夹
    cd ../../
    codesign -fs "iPhone Developer: 泽 梁 (WVZ5JP3N7M)" --no-strict --entitlements=Entitlements.plist kdweibo.app
}

codeSiginFramework
codesignApp