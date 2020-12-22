//
//  MemManagerViewController.m
//  iOSFundamentals
//
//  Created by Hui,Li on 2020/11/22.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#import "MemManagerViewController.h"
#import "LGPerson.h"

@interface MemManagerViewController ()

@end

@implementation MemManagerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"内存管理";
    NSArray *arr = @[@"2"];
//    _objc_autoreleasePoolPrint();
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
    
    [self causeBadAccess];
}

- (void)causeBadAccess {
    LGPerson *person = [[LGPerson alloc] init];
    [person run];
    LGNSLog(@"引用计数 %lu ", [person retainCount]);
    [person release];
//    LGNSLog(@"引用计数 %lu ", [person retainCount]);
    [person run];
}

@end
