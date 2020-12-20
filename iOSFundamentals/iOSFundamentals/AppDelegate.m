//
//  AppDelegate.m
//  iOSFundamentals
//
//  Created by Hui,Li on 2020/5/7.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "LGPatch.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window setBackgroundColor:[UIColor whiteColor]];

    ViewController *con = [[ViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:con];
    [self.window setRootViewController:nav];
    [self.window makeKeyAndVisible];
    
    LGPatch *patch = [LGPatch sharedPatch];
    //传入要修复的类和SEL 实际工程通过接口拿到 是个js字符串
    NSString *script = @"{\"className\": \"RuntimeViewController\", \"selectorName\": \"setupFirstName:lastName:\"}"
    [patch evaluateScript:script];
    return YES;
}
@end
