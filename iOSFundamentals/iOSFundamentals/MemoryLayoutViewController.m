//
//  MemoryLayoutViewController.m
//  iOSFundamentals
//
//  Created by nigelli on 2022/2/1.
//  Copyright © 2022 Hui,Li. All rights reserved.
//

#import "MemoryLayoutViewController.h"

@interface MemoryLayoutViewController ()

@end

@implementation MemoryLayoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /*
     内存分区：从高地址->低地址
     栈(Ox7...)、 堆(Ox6...)、全局静态区bss/data(Ox1...)、常量区CFString字面值)、代码段
     */
    LGNSLog(@"栈self = %p", self);
    NSInteger idx = 30;
    CGFloat offset = 17.f;
    LGNSLog(@"栈 idx = %p, offset = %p", &idx, &offset);
    NSObject *obj = [[NSObject alloc] init];
    CGFloat (^floatBlock) (CGFloat, CGFloat) = ^(CGFloat val1, CGFloat val2) {
        return val1 * val2;
    };
    LGNSLog(@"堆 obj = %p, floatBlock = %p", obj, floatBlock);
}

@end
