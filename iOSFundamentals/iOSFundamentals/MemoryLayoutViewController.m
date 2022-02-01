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
    NSInteger idx = 30;
    CGFloat offset = 17.f;

    NSObject *obj = [[NSObject alloc] init];
    MemoryLayoutViewController *vc = [[MemoryLayoutViewController alloc] init];

    CGFloat (^floatBlock) (CGFloat, CGFloat) = ^(CGFloat val1, CGFloat val2) {
        return val1 * val2;
    };
    void (^showBlock) (void) = ^{
        LGNSLog(@"print block");
    };
    showBlock();
    __block CGFloat value = 68;
    void (^captureValueBlock) (void) = ^{
        value *= 3;
    };
    captureValueBlock();
    NSInteger (^ __weak integerBlock) (NSInteger) = ^(NSInteger val) {
        return val * 11;
    };
    integerBlock(7);
    void (^ __weak stackBlk) (void) = ^{
        LGNSLog(@"栈block");
    };
    LGNSLog(@"栈block %@", stackBlk);

    NSString *str1 = @"Happy new year 2022, Feb 1st";
    NSString *str2 = @"To be a specalist in iOS development";

    LGNSLog(@"idx = %p, offset = %p, str1 = %p, str2 = %p", &idx, &offset, str1, str2);
    LGNSLog(@"floatBlock = %p, showBlock = %p, captureValueBlock = %p, integerBlock = %p", floatBlock, showBlock, captureValueBlock, integerBlock);
    LGNSLog(@"vc = %p, obj = %p", vc, obj);
    LGNSLog(@"self = %p", self);
}

@end
