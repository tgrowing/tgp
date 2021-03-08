# tgp

## 环境
* iOS 9.0+
* Xcode 10.0+

## 接入SDK

通过 CocoaPods 安装，在 podfile 里添加：

```
pod 'tgp', '~> x.x.x'
```
	
## 初始化SDK
参考 demo 工程中 AppDelegate.m 文件中 startBeacon 方法。


* 引入头文件
```
#import <BeaconAPI_Base/BeaconBaseInterface.h>
```
* 设置 appkey
```
[BeaconBaseInterface setAppKey:@"XXXX"];
```
* 设置 日志上报域名
```
[BeaconBaseInterface setUploadURL:@"XXXX"];
```

### 事件上报

* 实时上报
```
[BeaconBaseInterface onDirectUserAction:eventName isSucceed:YES elapse:0 size:0 params:params];
```

* 非实时上报
```
[BeaconBaseInterface onUserAction:eventName isSucceed:YES elapse:0 size:0 params:params];
```