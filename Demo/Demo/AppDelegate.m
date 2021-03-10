//
//  AppDelegate.m
//  DEMO
//
//  Created by yiqiwang on 2021/3/8.
//  Copyright © 2021 yiqiwang. All rights reserved.
//

#import "AppDelegate.h"
#import <BeaconAPI_Base/BeaconBaseInterface.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    NSString *qimei = [BeaconBaseInterface getQIMEI];
    NSLog(@"----test qimei----%@", qimei);
    
    [self startBeacon];
    
    return YES;
}

- (void)startBeacon {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{

        // log level：1 fetal 2 error 3 warn 4 info 5 debug 10 all
        [BeaconBaseInterface setLogLevel:10];

        // 应用唯一key 必须设置
        NSString *appKey = [[NSUserDefaults standardUserDefaults] objectForKey:@"appkey"];
        [BeaconBaseInterface setAppKey:appKey];
        
        // 私有化必须设置，默认为内部联调域名
        NSString *uploadURL = [[NSUserDefaults standardUserDefaults] objectForKey:@"uploadurl"];
        [BeaconBaseInterface setUploadURL:uploadURL];

        NSString *stratergyURL = [[NSUserDefaults standardUserDefaults] objectForKey:@"stratergyurl"];
        [BeaconBaseInterface setStratergyURL:stratergyURL];
        
        // 启用
        [BeaconBaseInterface enableAnalytics:nil gatewayIP:nil];
    });
}

@end
