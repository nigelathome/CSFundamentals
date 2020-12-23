//
//  MRCViewController.m
//  iOSFundamentals
//
//  Created by Hui,Li on 2020/12/22.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#import "MRCViewController.h"
#import "LGPerson.h"

@interface MRCViewController ()

@end

@implementation MRCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"MRC测试";
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
