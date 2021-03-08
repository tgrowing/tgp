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
#if DEBUG == 1
        [BeaconBaseInterface setLogLevel:10];
#endif
        NSString *appKey = [[NSUserDefaults standardUserDefaults] objectForKey:@"appkey"];
        [BeaconBaseInterface setAppKey:appKey];
        
        // 私有化必须设置
        NSString *uploadURL = [[NSUserDefaults standardUserDefaults] objectForKey:@"uploadurl"];
        [BeaconBaseInterface setUploadURL:uploadURL];
        
        NSString *stratergyURL = [[NSUserDefaults standardUserDefaults] objectForKey:@"stratergyurl"];
        [BeaconBaseInterface setStratergyURL:stratergyURL];
    });
}

@end
