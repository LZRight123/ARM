

@class NHAccountPhoneRegistration
[NHAccountPhoneRegistration startSendCodeWithPhoneNumber:captcha:ticket:sharkTicket:unusableMobileTicket:type:scene:finishBlock:]{

  NSMutableparameterstionary *parameters = [NSMutableparameterstionary parameterstionary]
  [parameters passport_setObject:captcha forKey:@"captcha"];
 
  [parameters passport_setObject:[HTSAccountUtil mixStringWithString:phonenumber] forKey:@"mobile"];
  [parameters passport_setObject:[HTSAccountUtil mixStringWithString:@(type).stringValue] forKey:@"type"];

  [parameters passport_setObject:@1 forKey:@"mix_mode"];

  if ( objc_msgSend(id, "length") ){
        [parameters passport_setObject:id forKey:@"ticket"];
  }

  if ( scene != 2 )
  {
    [parameters passport_setObject:@(scene) forKey:@"scene"];
  }
  if ( type == 20 ){
        [parameters passport_setObject:unusableMobileTicket forKey:@"unusable_mobile_ticket"];
  }

  -[self GET:[AWEPassportURLSettings sendCodeURLString]
  parameters:parameters
  model:[AWEPassportSendCodeModel class]
  completion:&block]
  //211 * 4 = 836 
//   https://aweme.snssdk.com/passport/mobile/send_code/v1/
}


[AWEPassportURLSettings sendCodeURLString]
{
  NSString *domain = [AWEPassportURLSettings domain];
  
  NSString *URLString = [domain stringWithFormat:%@"/passport/mobile/send_code/v1/"];
 
  return URLString;
}

[NHAccountPhoneRegistration GET:parameters:model:completion:] 
调用 [AWEPassportNetworkManager GET:parameters:model:completion:]
-> [[AWEPassportNetworkManager sharedManager]GET:parameters:model:completion:] 
 => manager [AWEPassportNetworkManager implementation]
 -> [AWEPassportConfigurationImplementation GETJSONDictionary:parameters:completion:]

//第一
 ->[BDAccountSessionTokenManager tokenChangeCompletion:]
 ->[TTNetworkManagerAFNetworking requestForJSONWithResponse:params:method:needCommonParams:headerField:requestSerializer:responseSerializer:autoResume:callback:]
 ->[TTNetworkHTTPClient requestForJSONWithURL:params:method:commonParams:headerField:pureChannelForJSONResponseSerializer:verifyRequest:requestSerializer:responseSerializer:responsePreprocessor:callback:callbackWithResponse:]
 ->[TTHTTPRequestSerializerBase URLRequestWithURL:params:method:constructingBodyBlock:commonParams:]
 ->[TTHTTPRequestSerializerBaseAFNetworking URLRequestWithURL:params:method:constructingBodyBlock:commonParams:]
 ->[AFHTTPRequestSerializer requestWithMethod:URLString:parameters:error:]

//第一
->[BDAccountSessionTokenManager tokenChangeCompletion:]
 ->[TTNetworkManagerAFNetworking requestForJSONWithResponse:params:method:needCommonParams:headerField:requestSerializer:responseSerializer:autoResume:callback:]
 ->[TTNetworkHTTPClient requestForJSONWithURL:params:method:commonParams:headerField:pureChannelForJSONResponseSerializer:verifyRequest:requestSerializer:responseSerializer:responsePreprocessor:callback:callbackWithResponse:]
 ->[TTNetworkManagerAFNetworking handleSecurityFactorHelper:]
 ->[TTHttpRequestAFNetworking URL]


TTHTTPRequestSerializerBase
 //第三 https://security.snssdk.com/passport/token/beat/?version_code=6.5.0&pass-region=1&pass-route=1&js_sdk_version=1.16.
  frame #1: 0x0000000104696ff0 Aweme`-[AFHTTPRequestSerializer requestBySerializingRequest:withParameters:error:] + 1008
    frame #2: 0x0000000104696044 Aweme`-[AFHTTPRequestSerializer requestWithMethod:URLString:parameters:error:] + 576
    frame #3: 0x0000000106acb494 Aweme`-[TTHTTPRequestSerializerBaseAFNetworking URLRequestWithURL:params:method:constructingBodyBlock:commonParams:] + 436
    frame #4: 0x0000000106aca9ec Aweme`-[TTHTTPRequestSerializerBase URLRequestWithURL:params:method:constructingBodyBlock:commonParams:] + 188
    frame #5: 0x00000001048b91f0 Aweme`-[AWENetworkRequestSerializer URLRequestWithURL:params:method:constructingBodyBlock:commonParams:] + 396
    frame #6: 0x0000000106ada230 Aweme`-[TTNetworkHTTPClient requestForJSONWithURL:params:method:commonParams:headerField:pureChannelForJSONResponseSerializer:verifyRequest:requestSerializer:responseSerializer:responsePreprocessor:callback:callbackWithResponse:] + 612
    frame #7: 0x0000000106adf174 Aweme`-[TTNetworkManagerAFNetworking requestForJSONWithURL:params:method:needCommonParams:requestSerializer:responseSerializer:autoResume:callback:] + 284
    frame #8: 0x00000001048bd764 Aweme`+[AWENetworkService _requestWithURLString:params:method:needCommonParams:modelClass:targetAttributes:requestSerializer:responseSerializer:responseBlock:completionBlock:] + 400
    frame #9: 0x00000001048bbf24 Aweme`___lldb_unnamed_symbol4376$$Aweme + 60
    frame #10: 0x000000010489d78c Aweme`___lldb_unnamed_symbol4147$$Aweme + 32


- (void)GET:(id)arg1 parameters:(id)arg2 model:(Class)arg3 completion:(block)arg4{

}


我看代码掉的是 掉的是这个接口 https://aweme.snssdk.com/passport/mobile/send_code/v1/
但是我抓包却是别的接口
https://iu.snssdk.com/passport/mobile/send_code/v1/
https://lf.snssdk.com/passport/mobile/send_code/v1/
https://verify.snssdk.com/view
https://verify.snssdk.com/get

uilseesiondelegate = <FABNetworkClient: 0x28040c7c0>
<TTNetworkHTTPClient: 0x283b5e940
AFHTTPSessionManager
ANSUploader
AWEVideoDownloadNetworkUtility_URLSession
HMDURLSessionManager
AFURLSessionManager