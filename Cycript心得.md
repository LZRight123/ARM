**- recursiveDescription** 
```
#打印对象的层级结构
cy# [[UIApp keyWindow] recursiveDescription].toString()
#例如
<iConsoleWindow: 0x156b6410; baseClass = UIWindow; frame = (0 0; 320 480); autoresize = W+H; gestureRecognizers = <NSArray: 0x156b6bc0>; layer = <UIWindowLayer: 0x156b6720>>
   | <UILayoutContainerView: 0x16258d80; frame = (0 0; 320 480); autoresize = W+H; layer = <CALayer: 0x16258e00>>
   |    | <UITransitionView: 0x16259610; frame = (0 0; 320 480); clipsToBounds = YES; autoresize = W+H; layer = <CALayer: 0x16259760>>
   |    |    | <UIViewControllerWrapperView: 0x16243bb0; frame = (0 0; 320 480); autoresize = W+H; layer = <CALayer: 0x1625a670>>
   |    |    |    | <UILayoutContainerView: 0x1601dd70; frame = (0 0; 320 480); autoresize = W+H; gestureRecognizers = <NSArray: 0x16001650>; layer = <CALayer: 0x16073fe0>>
   |    |    |    |    | <UINavigationTransitionView: 0x16004cc0; frame = (0 0; 320 480); clipsToBounds = YES; autoresize = W+H; layer = <CALayer: 0x16004e10>>
   |    |    |    |    |    | <UIViewControllerWrapperView: 0x1629d9a0; frame = (0 0; 320 480); layer = <CALayer: 0x1629da10>>
...
   |    |    | <MMBadgeView: 0x160055a0; baseClass = UIImageView; frame = (203 1; 20 20); opaque = NO; userInteractionEnabled = NO; layer = <CALayer: 0x16005640>>
   |    |    |    | <MMUILabel: 0x16004ec0; baseClass = UILabel; frame = (0 0; 0 0); hidden = YES; userInteractionEnabled = NO; tag = 10032; layer = <CALayer: 0x16004f70>>
   |    |    | <MMBadgeView: 0x16259810; baseClass = UIImageView; frame = (283 -4; 30 30); hidden = YES; opaque = NO; userInteractionEnabled = NO; layer = <CALayer: 0x162598b0>>
   |    |    |    | <MMUILabel: 0x1625a180; baseClass = UILabel; frame = (0 0; 0 0); userInteractionEnabled = NO; tag = 10032; layer = <CALayer: 0x1625a230>>
```

**_printHierarchy**

```
#一个比使用 nextResponder 更快捷的获取 ViewController 的方法。
[[[UIApp keyWindow] rootViewController] _printHierarchy].toString()

```
![image](http://cdn.iosre.com/uploads/default/original/2X/9/9d622f90c8d9186ad7c74444342714d7a633eb1e.png)

**_autolayoutTrace**

```
#简化了_recursiveDescription，去掉无用的，直接显示地址
cy# [[UIApp keyWindow] _autolayoutTrace].toString()
*<iConsoleWindow:0x156b6410>
|   *<UILayoutContainerView:0x16258d80>
|   |   *<UITransitionView:0x16259610>
|   |   |   *<UIViewControllerWrapperView:0x16243bb0>
|   |   |   |   *<UILayoutContainerView:0x1601dd70>
|   |   |   |   |   *<UINavigationTransitionView:0x16004cc0>
|   |   |   |   |   |   *<UIViewControllerWrapperView:0x1629d9a0>
...
|   |   |   |   <MMUILabel:0x1624b250>
|   |   |   <MMBadgeView:0x160055a0>
|   |   |   |   <MMUILabel:0x16004ec0>
|   |   |   <MMBadgeView:0x16259810>
|   |   |   |   <MMUILabel:0x1625a180>`
```

_ivarDescription
打印指定对象的实例变量的所有名称和值。以下是我们在Cycript中使用它的方法：
```
cy# [choose(SBApplication)[0] _ivarDescription].toString()
`<SBApplication: 0x1766cab0>:
in SBApplication:
\t_bundleIdentifier (NSString*): @"com.apple.social.remoteui.SocialUIService"
\t_displayIdentifier (NSString*): @"com.apple.social.remoteui.SocialUIService"
\t_path (NSString*): @"/Applications/SocialUIService.app"
\t_bundleVersion (NSString*): @"87"
\t_defaultImageNamesByScreenType (NSMutableDictionary*): <__NSDictionaryM: 0x17672a90>
\t_defaultImageNamesForOrientation (NSDictionary*): nil
...
in NSObject:
\tisa (Class): SBApplication`
```


_methodDescription
打印指定对象的所有属性，实例方法和类方法。以下是我们在Cycript中使用它的方法：

```
cy# [choose(SBApplicationController)[0] _methodDescription].toString()
`<SBApplicationController: 0x17642990>:
in SBApplicationController:
\tClass Methods:
\t\t+ (void) setClearSystemAppSnapshotsWhenLoaded:(BOOL)arg1; (0x1b2ad1)
...
\t\t+ (id) sharedInstanceIfExists; (0x1b2b6d)
\tInstance Methods:
\t\t- (id) setupApplication; (0x1b3e3d)
...
\t\t- (id) applicationWithDisplayIdentifier:(id)arg1; (0x1b3d0d)
in NSObject:
\tClass Methods:
\t\t+ (bool) cy\$hasImplicitProperties; (0xdb45d80)
...
\t\t+ (void) finalize; (0x39a49ad1)
\tProperties:
\t\t@property (nonatomic) BOOL isAccessibilityElement;  (@dynamic isAccessibilityElement;)
...
\t\t@property (nonatomic) BOOL shouldGroupAccessibilityChildren;  (@dynamic shouldGroupAccessibilityChildren;)
\tInstance Methods:
\t\t- (id) cy\$toCYON:(bool)arg1 inSet:(set<void *, std::less<void *>, std::allocator<void *> >*)arg2; (0xdb45b60)
...
\t\t- (void) finalize; (0x39a49ad5)`
```