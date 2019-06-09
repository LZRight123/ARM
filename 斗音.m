@class AWELoginViewController
- (void)sendCodeAction{
    AWEAccountUtils *one = [AWEAccountUtils sharedInstance];
    
    int context = [self __AWEAccountUtilsContext__];

    BOOL isWaiting = [isWaitingForCodeInContext:context];



}



@class AWEAccountUtils
- (int)_sendCodeToPhoneRegistrationType:(int)type{
    if (type > 9) {
        return 0;
    } else {

        return 24;
    }
}

- (id)_sceneToPhoneRegistrationScene:(int)sec{ //此时 是1 
    int result = 0; // x0

    if ( sec )
       result = 2;
    else
       result = 1;
    return result;
}

- (void)startSendCodeWithPhoneNumber:(id)arg1 type:(unsigned long long)arg2 
context:(unsigned long long)arg3 completion:(block)arg4{
    [self startSendCodeWithPhoneNumber:arg1 type:arg2 scene:1 context:arg3 completion:(block)arg4];
}

- (void)startSendCodeWithPhoneNumber:(id)phoneNumber type:(unsigned long long)type 
scene:(unsigned long long)scene context:(unsigned long long)context completion:block{
  NHAccountPhoneRegistration *objct1 = [NHAccountPhoneRegistration sharedInstance]                                                          
  id phoneNumberStringValue = [phoneNumber stringValue];
  id _captchaValueForContext = [self _captchaValueForContext:context];
  id _ticketForContext = [self _ticketForContext:context];
  AWEPSSOSecondaryVerificationInfo *info = [self verificationInfo];
  id objsharkTicket = [info sharkTicket];
  id unusableMobileTicketForContext = [self _unusableMobileTicketForContext:context]; //v29
  id _sendCodeToPhoneRegistrationType = [self _sendCodeToPhoneRegistrationType:type];//v30
  id _sceneToPhoneRegistrationScene = [self _sceneToPhoneRegistrationScene:scene];//v32

    [objct1 startSendCodeWithPhoneNumber:phoneNumberStringValue
     captcha:_captchaValueForContext //v20
     ticket:_ticketForContext //22
     sharkTicket:sharkTicket //27
     unusableMobileTicket:unusableMobileTicketForContext//29
     type:_sendCodeToPhoneRegistrationType //30
     scene:_sceneToPhoneRegistrationScene //32
     finishBlock:&ablock //v37
     ]
     // [NHAccountPhoneRegistration startSendCodeWithPhoneNumber:
}



(lldb) po/x 0x0000094d4f8
br set -a '0x0000094d4f8 + 0x0000000106110000'


(lldb) po/x 0x00119014 
br set -a '0x00119014 + 0x0000000106110000'

br set -a '0x935b04 + 0x0000000106110000'