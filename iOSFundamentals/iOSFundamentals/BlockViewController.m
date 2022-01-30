//
//  BlockViewController.m
//  iOSFundamentals
//
//  Created by Hui,Li on 2020/11/18.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#import "BlockViewController.h"

@interface BlockViewController ()

@end

@implementation BlockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"block 测试";
//    [self captureValueByBlock];
    [self makeRetainCycle];
//    self.myBlock();
    
    //3中类型block
    [self _3typesBlock];
#pragma mark - 执行 xcrun -sdk iphonesimulator clang -rewrite-objc BlockViewController.m 转成cpp文件
}

- (void)captureValueByBlock {
    __block int a = 10;
    void(^ModifyBlock)(int i) = ^(int i) {
        NSLog(@"__block修改前a=%d", a);
        NSLog(@"修改前i=%d", i);
        a = 30;
        NSLog(@"__block修改后a=%d", a);
        
    };
    ModifyBlock(a);
    NSLog(@"__block修改后a=%d", a);
    ///
    int b = 10;
    void(^CaptureBlock)(int i) = ^(int i) {
        NSLog(@"修改后b=%d", b);
        NSLog(@"修改后i=%d", i);
    };
    b = 60;
    CaptureBlock(b);
    NSLog(@"修改后b=%d", b);
}

- (void)makeRetainCycle {
    self.name = @"retain cycle";
//    NSString *name = [self.name copy];
    __weak typeof(self) weakSelf = self;
    self.myBlock = ^{
        __strong typeof(self) strongSelf = weakSelf;
        NSLog(@"%@", strongSelf.name);
    };
    self.myBlock();
    printf("Retain Count = %ld\n", CFGetRetainCount((__bridge CFTypeRef)(self.myBlock)));
}

- (void)dealloc {
    LGNSLog(@"release %@", [self class]);
}

- (void)_3typesBlock {
    /*
     block的isa指向block的类型：全局GlobalBlock、堆MallocBlock、栈StackBlock
     捕获外界变量——堆block
     弱引用——栈block
     不使用函数内部的变量——全局block
     */

    //全局block
    void (^globalBlk)(void) = ^{
        LGNSLog(@"全局block");
    };
    globalBlk();

    NSInteger (^sumBlk)(NSInteger, NSInteger) = ^(NSInteger val1, NSInteger val2) {
        return val1 + val2;
    };
    NSInteger result = sumBlk(3, 7);
    LGNSLog(@"result = %ld", result);
    
    //ARC下栈的block都会自动copy到堆block 自动释放
    int a = 3;
    void (^mallocBlk)(void) = ^{
        LGNSLog(@"堆block, %d", a);
    };
    mallocBlk();
    
    //栈block
    int b = 7;
    void (^ __weak stackBlk)(void) = ^{
        LGNSLog(@"栈block, b=%d", b);
    };
    LGNSLog(@"栈block %@", stackBlk);
}

@end

