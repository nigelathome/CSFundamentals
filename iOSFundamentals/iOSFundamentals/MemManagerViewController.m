//
//  MemManagerViewController.m
//  iOSFundamentals
//
//  Created by Hui,Li on 2020/11/22.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#import "MemManagerViewController.h"

@interface MemManagerViewController ()

@end

@implementation MemManagerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
