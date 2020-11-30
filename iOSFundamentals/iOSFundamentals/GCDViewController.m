//
//  GCDViewController.m
//  iOSFundamentals
//
//  Created by Hui,Li on 2020/5/7.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#import "GCDViewController.h"

@interface GCDViewController ()

@end

@implementation GCDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"GCD测试";
//    [self gcdTest1];
//    [self gcdTest2];
//    [self gcdTest3];
//    [self gcdTest4];
//    [self gcdTest5];
//    [self gcdTest6];
//    [self gcdTest7];
//    [self gcdTest8];
//    [self gcdTest9];
//    [self gcdTest10];
//    [self gcdTest11];
    [self gcdTest12];
}

- (void)gcdTest1 {
    dispatch_queue_t q1 = dispatch_queue_create("gcdTest1", DISPATCH_QUEUE_CONCURRENT);
    LGNSLog(@"1");
    dispatch_async(q1, ^{
        LGNSLog(@"2");
        dispatch_async(q1, ^{
            LGNSLog(@"3");
        });
        LGNSLog(@"4");
    });
    LGNSLog(@"5");
}

- (void)gcdTest2 {
    dispatch_queue_t q2 = dispatch_queue_create("gcdTest2", DISPATCH_QUEUE_CONCURRENT);
    LGNSLog(@"1");
    dispatch_async(q2, ^{
        LGNSLog(@"2");
        dispatch_sync(q2, ^{
            LGNSLog(@"3");
        });
        LGNSLog(@"4");
    });
    LGNSLog(@"5");
}

- (void)gcdTest3 {
    dispatch_queue_t q3 = dispatch_queue_create("gcdTest3", DISPATCH_QUEUE_SERIAL);
    LGNSLog(@"1");
    dispatch_async(q3, ^{
        LGNSLog(@"2");
        dispatch_async(q3, ^{
           LGNSLog(@"3");
        });
        LGNSLog(@"4");
    });
    LGNSLog(@"5");
}

- (void)gcdTest4 {
    dispatch_queue_t q4 = dispatch_queue_create("gcdTest4", DISPATCH_QUEUE_SERIAL);
    LGNSLog(@"1");
    dispatch_async(q4, ^{//blk1
        LGNSLog(@"2");
        dispatch_sync(q4, ^{//blk2
            LGNSLog(@"3");
        });
        //导致死锁原因：dispatch_sync方式需要等待blk2执行完才执行后面的语句 而q4是串行队列 blk2要等队列中正在执行的blk1执行完才执行
        //blk1嵌套blk2 所以blk2等blk1 也就是blk2 所以是互相等待 导致死锁
        LGNSLog(@"4");
    });
    LGNSLog(@"5");
}

- (void)gcdTest5 {
    dispatch_queue_t q5 = dispatch_get_main_queue();
    LGNSLog(@"1");
    dispatch_sync(q5, ^{//blk1
        LGNSLog(@"2");
    });
    LGNSLog(@"3");
    //造成死锁 q5是主队列主队列本质是串行队列 dispatch_sync方式等blk1执行完才执行之后的语句 而后面的语句因为gcdTest5已经在主队列中先
    //于blk1加入了主队列 gcdTest5包含了blk1 所以blk1得等后面的语句执行完才能轮到在主队列中执行 所以相互等待 导致死锁
}

- (void)gcdTest6 {
    LGNSLog(@"1");
    dispatch_queue_t q6 = dispatch_get_main_queue();
    dispatch_async(q6, ^{
        LGNSLog(@"2");
    });
    LGNSLog(@"3");
}

- (void)gcdTest7 {
    dispatch_queue_t q7 = dispatch_queue_create("gcdTest7", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(q7, ^{//blk1
        LGNSLog(@"1");
        sleep(1);
    });
    dispatch_async(q7, ^{//blk2
        LGNSLog(@"2");
        sleep(1);
    });
    dispatch_sync(q7, ^{//blk3
        LGNSLog(@"3");
        sleep(1);
    });
    LGNSLog(@"0");//blk0
    dispatch_async(q7, ^{//blk7
        LGNSLog(@"7");
        sleep(1);
    });
    dispatch_async(q7, ^{//blk8
        LGNSLog(@"8");
        sleep(1);
    });
    dispatch_async(q7, ^{//blk9
        LGNSLog(@"9");
        sleep(1);
    });
    LGNSLog(@"4");
    //dispatch_sync需要在blk3执行完才能继续执行 而队列是并行队列blk3立即执行需要队列中的blk1和blk2执行完才能执行3-0
    //dipatch_asyn不需要等blk7 blk8 blk9执行完所以会立即执行后面的语句 执行完主逻辑再执行队列总的内容 所以是4-7-8-9
    //blk1和blk2与blk0的执行顺序不一定 因为期间存在主线程到子线程 再从子线程到主线程的切换 blk1 blk2与blk0执行异步 1-2 与0相对顺序不确定
}

- (void)gcdTest8 {
    dispatch_queue_t q7 = dispatch_queue_create("gcdTest7", DISPATCH_QUEUE_SERIAL);
    dispatch_async(q7, ^{//blk1
        LGNSLog(@"1");
        sleep(1);
    });
    dispatch_async(q7, ^{//blk2
        LGNSLog(@"2");
        sleep(1);
    });
    dispatch_sync(q7, ^{//blk3
        LGNSLog(@"3");
        sleep(1);
    });
    LGNSLog(@"0");
    dispatch_async(q7, ^{//blk7
        LGNSLog(@"7");
        sleep(1);
    });
    dispatch_async(q7, ^{//blk8
        LGNSLog(@"8");
        sleep(1);
    });
    dispatch_async(q7, ^{//blk9
        LGNSLog(@"9");
        sleep(1);
    });
    LGNSLog(@"4");
    //dispatch_sync需要在blk3执行完才能继续执行 所以 3-0 而队列是线性队列blk3要执行需要队列中的blk1和blk2执行完才能执行 所以是1-2-3-0
    //dipatch_asyn不需要等blk7 blk8 blk9执行完所以会立即执行后面的语句 执行完主逻辑再执行队列总的内容 所以是0-4-7-8-9
}

- (void)gcdTest9 {
    __block NSInteger a = 0;
    while (a<100) {
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            a++;
            LGNSLog(@"a=%ld ===%@", a, [NSThread currentThread]);//blk
        });
    }
    LGNSLog(@"结束a=%ld", a);//blk1
    //因为是while循环 blk1要等到while结束才能执行a>=100 而因为while中的blk是异步在并行队列上执行的 执行顺序不确定
    //通过打印thread可以看到 blk确实是在子线程中执行 而且创建的子线程数远远小于100
}

- (void)gcdTest10 {
    dispatch_queue_t q10 = dispatch_get_global_queue(0, 0);
    dispatch_async(q10, ^{
        LGNSLog(@"1");
        [self performSelector:@selector(doTest) withObject:nil afterDelay:0];
        LGNSLog(@"3");
    });
    //performSelector after本质是往对应线程的Runloop加入定时器 而doTest在子线程中执行对应子线程的Runloop
    //子线程Runloop默认不开启 所以doTest不执行
}

- (void)doTest {
    LGNSLog(@"2");
}

- (void)gcdTest11 {
    LGNSLog(@"1");
    [self performSelector:@selector(doTest) withObject:nil afterDelay:0];
    LGNSLog(@"3");
    //performSelector after本质是对应的线程Runloop加入定时器 doTest在主线程中执行 主线程Runloop默认开启所以可以执行doTest
    //而doTest要在Runloop唤醒后执行 没有事件源触发Runloop会睡眠 需要等唤醒才执行所以1-3-2
}

- (void)gcdTest12 {
    dispatch_queue_t q12 = dispatch_get_global_queue(0, 0);
    dispatch_async(q12, ^{
        LGNSLog(@"1");
        [self performSelector:@selector(doTest) withObject:nil];
        LGNSLog(@"3");
    });
    //performSelector with 不需要定时执行所以本质是sendMsg 执行顺序等同普通函数调用 1-2-3
}

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    NSThread *thread = [[NSThread alloc] initWithBlock:^{//blk1
//        LGNSLog(@"1");
//        LGNSLog(@"%@", [NSThread currentThread]);
//    }];
//    [thread start];
//    [self performSelector:@selector(doTest) onThread:thread withObject:nil waitUntilDone:YES];
//    //在子线程执行doTest waitUtilDone是指是否等待@selector执行才继续执行之后的语句
//    //当thread执行完blk1后就立即退出 所以thread再去执行doTest就崩溃了
      //如果把waitUtilDone改成NO 则doTest也不会执行 因为该线程runloop没有开启
//    LGNSLog(@"3");
//}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSThread *thread = [[NSThread alloc] initWithBlock:^{//blk1
        LGNSLog(@"1");
        LGNSLog(@"%@", [NSThread currentThread]);
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
    }];
    [thread start];
    [self performSelector:@selector(doTest) onThread:thread withObject:nil waitUntilDone:NO];
    //创建并启动了thread的runloop doTest就能执行了 也不会引起崩溃 因为thread不会立即退出 #这里runloop的运行模式必须是defaultMode
    //也可以把doTest派发到主线程执行也可以正常执行
    LGNSLog(@"3");
}

@end
