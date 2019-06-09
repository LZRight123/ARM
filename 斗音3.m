[HTSAccountUtil mixStringWithString:str]

id __cdecl +[HTSAccountUtil mixStringWithString:](HTSAccountUtil_meta *self, SEL a2, id a3)
{
  if ( [str isKindOfClass:[NSString class] && [str length] )
  {

    NSMutableString *result = nil;
    NSData *data = [str dataUsingEncoding:4];//v6

    if ( data.length )
    {

      v7 = (char *)&v15 - (((unsigned __int64)objc_msgSend(v6, "length") + 15) & 0xFFFFFFFFFFFFFFF0LL);
      
      //此时 是电话号的就  data.lenght = 14 (+8615271327766) 62line 掉用
      int dataL = 14
      [data getBytes:v7 lenght:dataL];

      NSMutableString *tempStr = [NSMutableString stringWithCapacity: 2 * dataL];

      if ( data.length )
      {
        do
          [tempStr appendFormat:@"%02x",(unsigned __int8)(v7[v12++] ^ 5)];//93行
          //objc_msgSend(tempStr, "appendFormat:", CFSTR("%02x"), (unsigned __int8)(v7[v12++] ^ 5));
        while ( data.length > 0 );
      }
      tempStr1 = [tempStr copy];//104  2e3d333430373234363732323333
    }
    else
    {
      result = nil;
    }
  }
  else
  {
    result = nil;
  }
  return result;
}