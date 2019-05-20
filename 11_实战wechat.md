UI分析：
层级信息页面：
BaseMsgContentViewController
MMSearchBarDisplayController
MMUIViewController
UIViewController
信息的cell:
ChatTableViewCell
尝试hook didselectedCell方法 hook到了 不过在点红包的同时 弹了个警告还是掉了打开红包的方法，因此推测在cell内作区域判断

尝试hook setViewModel方法
base->modelType=1
model->m_messageWrap->m_uiMessageType = 49
                    ->m_uiStatus = 4
                    ->m_nsContent 内容

到这里，换了个思路
把BaseMsgContentViewController 所有的方法log出来 发现以下可hook方法
```
%hook BaseMsgContentViewController
- (void)onNewSyncStart {
    %log;
    %orig; 
    // 0x103307358
}

- (void)onNewSyncFinish {
    %log;
    %orig;
    // 0x103307368
}


- (void)addMessageNode:(id)arg1 layout:(_Bool)arg2 addMoreMsg:(_Bool)arg3 {
    %log;
    %orig;
}

- (id)getMessageChatContactByMessageWrap:(id)arg1 {
    %log;
    id r = %orig;
    HBLogDebug(@" = %@", r);
    return r;
}

- (id)GetContact {
    %log;
    id r = %orig;
    HBLogDebug(@" = %@", r);
    return r;
}

- (void)didFinishedLoading:(id)arg1 {
    %log;
    %orig;
}
%end
```

计算出 ASLR = 0x0000000000600000
onNewSyncFinish -after =  0x103907358
下断点 br s -a 0x103907358
发消息后 可疑地址有: 0x0000000101f2d5dc 0x0000000100f7d2f0 => 0x10192D5DC ,0x10014D2F0
000000010192d3ec MMExtensionCenter + ASLR = 0x101B5D3EC
经过分析，onNewSyncStart这个方法 像只是写在些vc里，但是却没有具体逻辑实现可能是留给子类用的需要换个思路了

再分析 addMessageNode: 方法 重新运行 ，此时 
ASLR = 0x00000000004c8000
方法的绝对地址 00000001032dbd60 + ASLR = 0x1037A3D60
frame #0: 0x00000001037a3d60 - ASLR = 0x1032DBD60 
Go->address
frame #2: 0x0000000103a8f274 - ASLR = 0x00000001035C7274 -> 切换到浮动图表模式，可以看到，这个是在 0x1035c706c [BaseMsgContentLogicController DidAddMsg:]里，条件判断执行过来的
frame #3: 0x0000000103a762dc - ASLR = 0x103A29ADC -> [ChatRoomAdminViewController addMember]: 0000000103a29a98
frame #4: 0x0000000101df55dc - ASLR = 0x10192D5DC -> [MMExtensionCenter unRegisterAllKeyExtension:withTarget:] 000010192d32c //这个一直进pass掉
frame #5: 0x00000001044c946c - ASLR = 0x10400146C ->  -[CMessageMgr MainThreadNotifyToExt:]: 000000010400123c
对上面四个下断点呗 
p/x ls 0x000000010ce46530 - ASLR = 0x10C97E530
现在发消息 断点顺序如下: addMessageNode -> [BaseMsgContentLogicController DidAddMsg:] -> [ChatRoomAdminViewController addMember] -> [CMessageMgr MainThreadNotifyToExt:]
不知道断点为什么会这样进，应该是 addMessageNode 最后进才对呀？？？
退到首页 0x00000001044c946c 
关掉会话窗口 0x00000001044c946c
退到后台 0x00000001044c946c
接收消息的方法为 0x00000001044c946c 对应的 [CMessageMgr MainThreadNotifyToExt:]
后台一段时间 ，一个断点都没走过了

BaseMsgContentViewController的hook 可以全注视了  。然后hook CMessageMgr
消息来了后 会依次调用
```
方法执行顺序如下： 也就是说hook的方法越靠上 在同一网络情况下就会越快的抢到红包
- (id)GetMsg:(id)arg1 LocalID:(unsigned int)arg2 hasError:(_Bool *)arg3{
    CMessageWrap *msg = %orig;
    return msg;
}
从这开始 下面的 msg 指针指向一个地址，应该是把上面要msg copy了一下
- (void)AsyncOnAddMsg:(id)arg1 MsgWrap:(id)arg2 {
    %orig;
}

//这个会把上面两个方法的消息合并。 hook 这个方法。
- (void)onNewSyncAddMsgSessionArray:(id)arg1 withUsers:(id)arg2 {
    %orig;
}
- (void)AsyncOnAddMsgListForSession:(id)arg1 NotifyUsrName:(id)arg2 {
    %orig;
}

- (void)onNewSyncShowPush:(id)arg1 isAlwaysShow:(_Bool)arg2 {
    %orig;
}

- (void)AsyncOnPushMsg:(id)arg1 isAlwaysShow:(_Bool)arg2 {
    %orig;
}
```
最后决定hook 这个方法，
```
- (void)onNewSyncAddMsgSessionArray:(id)arg1 withUsers:(id)arg2 {
    %orig;
    if ([arg1 isKindOfClass:[NSDictionary class]]) {
        for (id item in [(NSDictionary *)arg1 allValues]) {
            if ([item isKindOfClass:NSClassFromString(@"CMessageWrap")]) {
                [Tool show:@"我是消息，不是红包"];
                @try {
                    if ([[item valueForKey:@"m_uiMessageType"] isEqual:@49]) {
                        [Tool show:@"我是红包"];
                    }
                } @catch (NSException *exception) {
                    
                } @finally {
                    
                }
            }
        }
    }
}
```

然后进入下一步 点红包，开按钮
lldb-> target = WCRedEnvelopesReceiveHomeView ,action = OnOpenRedEnvelopes; WCRedEnvelopesReceiveHomeView OnOpenRedEnvelopes
然后看下这个方法做了什么事

[<WCRedEnvelopesReceiveControlLogic: 0x281ed4070> OnReceiverQueryRedEnvelopesRequest:{
    "expression_md5" = "";
    hbStatus = 2;
    hbType = 0;
    isSender = 0;
    preStrainFlag = 1;
    receiveStatus = 0;
    scenePicSwitch = 1;
    sendId = 1000039401201905196010917231866;
    sendUserName = "wxid_6736jizor6ek22";
    showRecNormalExpression = 1;
    showYearExpression = 1;
    statusMess = "\U7ed9\U4f60\U53d1\U4e86\U4e00\U4e2a\U7ea2\U5305";
    timingIdentifier = EF27A037E77A795C31EF36B35E24F4BB;
    watermark = "";
    wishing = "\U606d\U559c\U53d1\U8d22\Uff0c\U5927\U5409\U5927\U5229";
} Error:(null)]



 