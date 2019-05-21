Assembly`main:
    0x100c16804 <+0>:   sub    sp, sp, #0x60             ; =0x60 
    0x100c16808 <+4>:   stp    x29, x30, [sp, #0x50]
    0x100c1680c <+8>:   add    x29, sp, #0x50            ; =0x50 
    0x100c16810 <+12>:  stur   wzr, [x29, #-0x4]
    0x100c16814 <+16>:  stur   w0, [x29, #-0x8]
    0x100c16818 <+20>:  stur   x1, [x29, #-0x10]
    0x100c1681c <+24>:  bl     0x100c16b64               ; symbol stub for: objc_autoreleasePoolPush
->  0x100c16820 <+28>:  mov    x1, #0xa  #x1 = 10
    0x100c16824 <+32>:  stur   x1, [x29, #-0x18] //
    0x100c16828 <+36>:  mov    x1, #0x14
    0x100c1682c <+40>:  stur   x1, [x29, #-0x20]
    0x100c16830 <+44>:  ldur   x1, [x29, #-0x18]
    0x100c16834 <+48>:  ldur   x30, [x29, #-0x20]
    0x100c16838 <+52>:  add    x1, x1, x30
    0x100c1683c <+56>:  str    x1, [sp, #0x28]
    0x100c16840 <+60>:  ldur   x1, [x29, #-0x18]
    0x100c16844 <+64>:  str    x0, [sp, #0x20]
    0x100c16848 <+68>:  mov    x0, x1
    0x100c1684c <+72>:  bl     0x100c16bac               ; symbol stub for: printf
    0x100c16850 <+76>:  adrp   x1, 2
    0x100c16854 <+80>:  add    x1, x1, #0xd10            ; =0xd10 
    0x100c16858 <+84>:  adrp   x30, 2
    0x100c1685c <+88>:  add    x30, x30, #0xd18          ; =0xd18 
    0x100c16860 <+92>:  ldur   w8, [x29, #-0x8]
    0x100c16864 <+96>:  ldur   x9, [x29, #-0x10]
    0x100c16868 <+100>: ldr    x30, [x30]
    0x100c1686c <+104>: ldr    x1, [x1]
    0x100c16870 <+108>: str    w0, [sp, #0x1c]
    0x100c16874 <+112>: mov    x0, x30
    0x100c16878 <+116>: str    w8, [sp, #0x18]
    0x100c1687c <+120>: str    x9, [sp, #0x10]
    0x100c16880 <+124>: bl     0x100c16b70               ; symbol stub for: objc_msgSend
    0x100c16884 <+128>: bl     0x100c16b40               ; symbol stub for: NSStringFromClass
    0x100c16888 <+132>: mov    x29, x29
    0x100c1688c <+136>: bl     0x100c16b94               ; symbol stub for: objc_retainAutoreleasedReturnValue
    0x100c16890 <+140>: ldr    w8, [sp, #0x18]
    0x100c16894 <+144>: str    x0, [sp, #0x8]
    0x100c16898 <+148>: mov    x0, x8
    0x100c1689c <+152>: ldr    x1, [sp, #0x10]
    0x100c168a0 <+156>: mov    x9, #0x0
    0x100c168a4 <+160>: mov    x2, x9
    0x100c168a8 <+164>: ldr    x3, [sp, #0x8]
    0x100c168ac <+168>: bl     0x100c16b4c               ; symbol stub for: UIApplicationMain
    0x100c168b0 <+172>: stur   w0, [x29, #-0x4]
    0x100c168b4 <+176>: ldr    x1, [sp, #0x8]
    0x100c168b8 <+180>: mov    x0, x1
    0x100c168bc <+184>: bl     0x100c16b88               ; symbol stub for: objc_release
    0x100c168c0 <+188>: ldr    x0, [sp, #0x20]
    0x100c168c4 <+192>: bl     0x100c16b58               ; symbol stub for: objc_autoreleasePoolPop
    0x100c168c8 <+196>: ldur   w0, [x29, #-0x4]
    0x100c168cc <+200>: ldp    x29, x30, [sp, #0x50]
    0x100c168d0 <+204>: add    sp, sp, #0x60             ; =0x60 
    0x100c168d4 <+208>: ret    
