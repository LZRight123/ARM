
<!-- -[<CMessageMgr: 0x282af6000> GetUnReadCountInHello:shakeapp] -->

<!-- -[<CMessageMgr: 0x282af6000> GetMsg:wxid_6736jizor6ek22 LocalID:21 hasError:0x1705e1d40] -->

<!-- -[<CMessageMgr: 0x282af6000> CheckMessageStatus:wxid_6736jizor6ek22 Msg:{m_uiMesLocalID=21, m_ui64MesSvrID=2852637943987676677, m_nsFromUsr=wxi*k22~19, m_nsToUsr=lzl*340~12, m_uiStatus=3, type=1, msgSource="<msgsource><sequence_id>667684150</sequence_id></msgsource>"} ] -->



<!-- -[<CMessageMgr: 0x282af6000> onNewSyncAddMsgSessionArray:{
    "wxid_6736jizor6ek22" = "{m_uiMesLocalID=21, m_ui64MesSvrID=2852637943987676677, m_nsFromUsr=wxi*k22~19, m_nsToUsr=lzl*340~12, m_uiStatus=3, type=1, msgSource=\"<msgsource><sequence_id>667684150</sequence_id></msgsource>\"} ";
} withUsers:{(
    "wxid_6736jizor6ek22"
)}] -->

<!-- -[<CMessageMgr: 0x282af6000> AsyncOnAddMsgListForSession:{
    "wxid_6736jizor6ek22" = "{m_uiMesLocalID=21, m_ui64MesSvrID=2852637943987676677, m_nsFromUsr=wxi*k22~19, m_nsToUsr=lzl*340~12, m_uiStatus=3, type=1, msgSource=\"<msgsource><sequence_id>667684150</sequence_id></msgsource>\"} ";
} NotifyUsrName:{(
    "wxid_6736jizor6ek22"
)}] -->

<!-- -[<CMessageMgr: 0x282af6000> onNewSyncShowPush:{m_uiMesLocalID=21, m_ui64MesSvrID=2852637943987676677, m_nsFromUsr=wxi*k22~19, m_nsToUsr=lzl*340~12, m_uiStatus=3, type=1, msgSource="<msgsource><sequence_id>667684150</sequence_id></msgsource>"}  isAlwaysShow:1] -->

<!-- -[<CMessageMgr: 0x282af6000> AsyncOnPushMsg:{m_uiMesLocalID=21, m_ui64MesSvrID=2852637943987676677, m_nsFromUsr=wxi*k22~19, m_nsToUsr=lzl*340~12, m_uiStatus=3, type=1, msgSource="<msgsource><sequence_id>667684150</sequence_id></msgsource>"}  isAlwaysShow:1] -->


<!-- -[<CMessageMgr: 0x282af6000> GetUnReadCount:wxid_6736jizor6ek22] -->

-[<CMessageMgr: 0x282af6000> MainThreadNotifyToExt:{
    1 = 12;
    11 = 1;
    3 = "{m_uiMesLocalID=21, m_ui64MesSvrID=2852637943987676677, m_nsFromUsr=wxi*k22~19, m_nsToUsr=lzl*340~12, m_uiStatus=3, type=1, msgSource=\"<msgsource><sequence_id>667684150</sequence_id></msgsource>\"} ";
}]

<!-- GetUnReadCountInHello -->
- (id)GetMsg:(id)arg1 LocalID:(unsigned int)arg2 hasError:(_Bool *)arg3{
    CMessageWrap *msg = %orig;
    return msg;
    msg = 0x10d6f6c60
    m_uiMesLocalID=1, m_ui64MesSvrID=6947271423181540799
}

- (void)AsyncOnAddMsg:(id)arg1 MsgWrap:(id)arg2 {
    %orig;
    msg = 0x11959ccd0
    m_uiMesLocalID=1, m_ui64MesSvrID=6947271423181540799 
}

//这个会把上面两个方法的消息合并。
- (void)onNewSyncAddMsgSessionArray:(id)arg1 withUsers:(id)arg2 {
    %orig;
    msg = dic[key] = 0x11959ccd0
}
- (void)AsyncOnAddMsgListForSession:(id)arg1 NotifyUsrName:(id)arg2 {
    %orig;
    msg = dic[key] = 0x11959ccd0
}



- (void)onNewSyncShowPush:(id)arg1 isAlwaysShow:(_Bool)arg2 {
    %orig;
    msg = dic[key] = 0x11959ccd0
}

- (void)AsyncOnPushMsg:(id)arg1 isAlwaysShow:(_Bool)arg2 {
    %orig;
    msg = dic[key] = 0x11959ccd0
}
