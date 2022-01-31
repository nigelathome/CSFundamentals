//
//  BlockViewController.m
//  iOSFundamentals
//
//  Created by Hui,Li on 2020/11/18.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#import "BlockViewController.h"

@interface BlockViewController ()

@property (nonatomic, copy) GetSum mySumBlock;
@property (nonatomic, assign) NSInteger leftVal;
@property (nonatomic, assign) NSInteger rightVal;
@property (nonatomic, copy) ShowSumBlock showSumBlock;

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

//    [self makeReleaseIssue];
//    [self makeReleaseIssueWithWeak];
//    [self weakStrongDance];
    [self resolveRetainCycleByBlock];
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
    LGNSLog(@"释放 %@", [self class]);
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

- (void)makeReleaseIssue {
    self.leftVal = 5;
    self.rightVal = 7;
    self.mySumBlock = ^(NSInteger val1, NSInteger val2) {
        LGNSLog(@"弱引用---》");
        NSInteger res = self.leftVal * val1 + self.rightVal * val2;
        LGNSLog(@"弱引用---》block中的结果 %ld", res);
        return res;
    };
    NSInteger result = self.mySumBlock(1, 1);
    LGNSLog(@"弱引用---》结果 %ld", result);
}

- (void)makeReleaseIssueWithWeak {
    self.leftVal = 5;
    self.rightVal = 7;
    __weak typeof(self) weakSelf = self;
    self.showSumBlock = ^(NSInteger val1 , NSInteger val2) {
        LGNSLog(@"延迟任务等待执行---》");
        //使用weakSelf可以解决循环引用的问题
        //因为延迟调用的原因 如果在调用的时候对象本身已经被释放了 那么调用结果将显示异常
        //如果退出本vc 但这个block还没有执行 那么vc被释放了 当block执行的时候res的值将异常
        //如果这个block是一个网络请求任务 通过异步的方式进行网络调用 将会出现异常
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            NSInteger res = weakSelf.leftVal * val1 + weakSelf.rightVal * val2;
            LGNSLog(@"延迟任务开始执行---》执行结果 %ld", res);
        });
    };
    self.showSumBlock(1, 1);
    LGNSLog(@"弱引用---》结束");
}

- (void)weakStrongDance {
    self.leftVal = 5;
    self.rightVal = 7;
    __weak typeof(self) weakSelf = self;
    self.showSumBlock = ^(NSInteger val1 , NSInteger val2) {
        LGNSLog(@"延迟任务等待执行---》");
        //使用weakSelf可以解决循环引用的问题
        //因为延迟调用的原因 如果在调用的时候对象本身已经被释放了 那么调用结果将显示异常
        //如果退出本vc 但这个block还没有执行 那么vc被释放了 当block执行的时候res的值将异常
        //如果这个block是一个网络请求任务 通过异步的方式进行网络调用 将会出现异常
        //使用__strong延迟vc本身的释放 保证延迟任务执行完成才释放vc
        __strong typeof(weakSelf) strongSelf = weakSelf;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            NSInteger res = strongSelf.leftVal * val1 + strongSelf.rightVal * val2;
            LGNSLog(@"延迟任务开始执行---》执行结果 %ld", res);
        });
    };
    self.showSumBlock(1, 1);
    LGNSLog(@"弱引用---》结束");
}

- (void)resolveRetainCycleByBlock {
    /*
     block 引起的循环引用
     原因：self持有block block的函数体包含了self的属性从而持有self；self -1-> block -2-> self
     解决办法1：上将block设置成weak，但这样会导致因为block引用计数=0创建之后会被里面释放
     解决办法2：打破block持有self weak-strong-dance
     解决办法3：中介变量 self->block ; 中间变量弱引用self；block -> 中间变量
     解决办法4：通过block传参拿到self的属性而不是直接持有self
     */
    //中介变量
    self.leftVal = 5;
    self.rightVal = 7;
    __weak typeof(self) vc = self;
    self.showSumBlock = ^(NSInteger val1 , NSInteger val2) {
        NSInteger res = vc.leftVal * val1 + vc.rightVal * val2;
        LGNSLog(@"延迟任务开始执行---》执行结果 %ld", res);
    };
    self.showSumBlock(1, 1);
    LGNSLog(@"弱引用---》结束");

}

@end

