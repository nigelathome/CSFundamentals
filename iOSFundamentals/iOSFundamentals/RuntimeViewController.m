//
//  RuntimeViewController.m
//  iOSFundamentals
//
//  Created by Hui,Li on 2020/12/4.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#import "RuntimeViewController.h"
#import "NSMutableArray+SafeMutableArray.h"

@interface RuntimeViewController ()

@end

@implementation RuntimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self exchangeIMP];
    [self printA];
    [self printB];
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    [arr addObject:@"1"];
    [arr addObject:@"2"];
    [arr addObject:@"3"];
    id obj = [arr objectAtIndex:3];
}

- (void)printA {
    LGNSLog(@"打印A......");
}

- (void)printB {
    LGNSLog(@"打印B......");
}

- (void)exchangeIMP {
    //交换方法的实现，并测试打印
    Method methodA = class_getInstanceMethod([self class], @selector(printA));
    Method methodB = class_getInstanceMethod([self class], @selector(printB));
    method_exchangeImplementations(methodA, methodB);
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
