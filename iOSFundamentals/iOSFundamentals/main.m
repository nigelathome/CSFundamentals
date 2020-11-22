//
//  main.m
//  iOSFundamentals
//
//  Created by Hui,Li on 2020/5/7.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
//    _objc_autoreleasePoolPrint();     // print1
    @autoreleasepool {
//        appDelegateClassName = NSStringFromClass([AppDelegate class]);
        NSArray *arr = @[@"1"];
        [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSArray *arr1 = @[@"2"];
            _objc_autoreleasePoolPrint();
        }];
        NSLog(@"*******************************");
        _objc_autoreleasePoolPrint();
        NSLog(@"*******************************");
        for (NSNumber *num in arr) {
            NSArray *arr2 = @[@"2"];
            _objc_autoreleasePoolPrint();
        }
//        _objc_autoreleasePoolPrint(); // print2
//        NSObject *p1 = [[[NSObject alloc] init] autorelease];
//        NSObject *p2 = [[[NSObject alloc] init] autorelease];
//        _objc_autoreleasePoolPrint(); // print3
    }
//    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
    _objc_autoreleasePoolPrint();     // print4
    return 0;
}
