@ object-c
01-汇编-IF-SWITCH`__if__:
    0x10492256c <+0>:   sub    sp, sp, #0x20             ; =0x20 
    0x104922570 <+4>:   stp    x29, x30, [sp, #0x10]
    0x104922574 <+8>:   add    x29, sp, #0x10            ; =0x10 
->  0x104922578 <+12>:  mov    w8, #0x5
    0x10492257c <+16>:  stur   w8, [x29, #-0x4]
    0x104922580 <+20>:  ldur   w8, [x29, #-0x4]
    0x104922584 <+24>:  cmp    w8, #0x3                  ; =0x3 
    0x104922588 <+28>:  b.ne   0x1049225a0               ; <+52> at main.m:17:16
    0x10492258c <+32>:  adrp   x0, 1
    0x104922590 <+36>:  add    x0, x0, #0xf1c            ; =0xf1c 
    0x104922594 <+40>:  bl     0x104922c04               ; symbol stub for: printf
    0x104922598 <+44>:  str    w0, [sp, #0x8]
    0x10492259c <+48>:  b      0x1049225d4               ; <+104> at main.m:22:1
    0x1049225a0 <+52>:  ldur   w8, [x29, #-0x4]
    0x1049225a4 <+56>:  cmp    w8, #0x4                  ; =0x4 
    0x1049225a8 <+60>:  b.ne   0x1049225c0               ; <+84> at main.m:20:9
    0x1049225ac <+64>:  adrp   x0, 1
    0x1049225b0 <+68>:  add    x0, x0, #0xf20            ; =0xf20 
    0x1049225b4 <+72>:  bl     0x104922c04               ; symbol stub for: printf
    0x1049225b8 <+76>:  str    w0, [sp, #0x4]
    0x1049225bc <+80>:  b      0x1049225d0               ; <+100> at main.m
    0x1049225c0 <+84>:  adrp   x0, 1
    0x1049225c4 <+88>:  add    x0, x0, #0xf24            ; =0xf24 
    0x1049225c8 <+92>:  bl     0x104922c04               ; symbol stub for: printf
    0x1049225cc <+96>:  str    w0, [sp]
    0x1049225d0 <+100>: b      0x1049225d4               ; <+104> at main.m:22:1
    0x1049225d4 <+104>: ldp    x29, x30, [sp, #0x10]
    0x1049225d8 <+108>: add    sp, sp, #0x20             ; =0x20 
    0x1049225dc <+112>: ret    

@ swift
ARM`__if__():
    0x10428ce74 <+0>:   sub    sp, sp, #0x50             ; =0x50 
    0x10428ce78 <+4>:   stp    x29, x30, [sp, #0x40]
    0x10428ce7c <+8>:   add    x29, sp, #0x40            ; =0x40 
->  0x10428ce80 <+12>:  b      0x10428ce84               ; <+16> at AppDelegate.swift
    0x10428ce84 <+16>:  orr    w8, wzr, #0x1
    0x10428ce88 <+20>:  mov    x0, x8
    0x10428ce8c <+24>:  bl     0x10428e358               ; symbol stub for: generic specialization <Any> of Swift._allocateUninitializedArray<A>(Builtin.Word) -> (Swift.Array<A>, Builtin.RawPointer)
    0x10428ce90 <+28>:  adrp   x30, 3
    0x10428ce94 <+32>:  add    x30, x30, #0x20           ; =0x20 
    0x10428ce98 <+36>:  orr    w8, wzr, #0x4
    0x10428ce9c <+40>:  mov    x2, x8
    0x10428cea0 <+44>:  orr    w8, wzr, #0x1
    0x10428cea4 <+48>:  stur   x2, [x29, #-0x8]
    0x10428cea8 <+52>:  mov    x2, x8
    0x10428ceac <+56>:  stur   x0, [x29, #-0x10]
    0x10428ceb0 <+60>:  mov    x0, x30
    0x10428ceb4 <+64>:  ldur   x30, [x29, #-0x8]
    0x10428ceb8 <+68>:  stur   x1, [x29, #-0x18]
    0x10428cebc <+72>:  mov    x1, x30
    0x10428cec0 <+76>:  bl     0x10428e2ec               ; symbol stub for: Swift.String.init(_builtinStringLiteral: Builtin.RawPointer, utf8CodeUnitCount: Builtin.Word, isASCII: Builtin.Int1) -> Swift.String
    0x10428cec4 <+80>:  adrp   x30, 4
    0x10428cec8 <+84>:  ldr    x30, [x30]
    0x10428cecc <+88>:  ldur   x9, [x29, #-0x18]
    0x10428ced0 <+92>:  str    x30, [x9, #0x18]
    0x10428ced4 <+96>:  str    x0, [x9]
    0x10428ced8 <+100>: str    x1, [x9, #0x8]
    0x10428cedc <+104>: bl     0x10428ce24               ; default argument 1 of Swift.print(_: Any..., separator: Swift.String, terminator: Swift.String) -> () at <compiler-generated>
    0x10428cee0 <+108>: str    x1, [sp, #0x20]
    0x10428cee4 <+112>: str    x0, [sp, #0x18]
    0x10428cee8 <+116>: bl     0x10428ce4c               ; default argument 2 of Swift.print(_: Any..., separator: Swift.String, terminator: Swift.String) -> () at <compiler-generated>
    0x10428ceec <+120>: ldur   x9, [x29, #-0x10]
    0x10428cef0 <+124>: str    x0, [sp, #0x10]
    0x10428cef4 <+128>: mov    x0, x9
    0x10428cef8 <+132>: ldr    x30, [sp, #0x18]
    0x10428cefc <+136>: str    x1, [sp, #0x8]
    0x10428cf00 <+140>: mov    x1, x30
    0x10428cf04 <+144>: ldr    x2, [sp, #0x20]
    0x10428cf08 <+148>: ldr    x3, [sp, #0x10]
    0x10428cf0c <+152>: ldr    x4, [sp, #0x8]
    0x10428cf10 <+156>: bl     0x10428e370               ; symbol stub for: Swift.print(_: Any..., separator: Swift.String, terminator: Swift.String) -> ()
    0x10428cf14 <+160>: ldr    x0, [sp, #0x8]
    0x10428cf18 <+164>: bl     0x10428e400               ; symbol stub for: swift_bridgeObjectRelease
    0x10428cf1c <+168>: ldr    x0, [sp, #0x20]
    0x10428cf20 <+172>: bl     0x10428e400               ; symbol stub for: swift_bridgeObjectRelease
    0x10428cf24 <+176>: ldur   x0, [x29, #-0x10]
    0x10428cf28 <+180>: bl     0x10428e400               ; symbol stub for: swift_bridgeObjectRelease
    0x10428cf2c <+184>: b      0x10428cf30               ; <+188> at AppDelegate.swift:30:1
    0x10428cf30 <+188>: ldp    x29, x30, [sp, #0x40]
    0x10428cf34 <+192>: add    sp, sp, #0x50             ; =0x50 
    0x10428cf38 <+196>: ret    
