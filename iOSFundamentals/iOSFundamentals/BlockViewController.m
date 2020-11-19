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
}

@end
