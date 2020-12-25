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
//    [self gcdTest12];
//    [self gcdTest13];
//    [self gcdTest14];
//    [self gcdTest15];
//    [self gcdTest16];
//    [self gcdTest17];
//    [self gcdTest18];
//    [self gcdTest19];
//    [self gcdTest20];
//    [self gcdTest21];
//    [self gcdTest22];
//    [self gcdTest23];
    [self ABC];
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

- (void)gcdTest13 {
    dispatch_semaphore_t signal = dispatch_semaphore_create(1);//信号量为1
    dispatch_time_t overTime = dispatch_time(DISPATCH_WALLTIME_NOW, 3 * NSEC_PER_SEC);
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{//blk1
        dispatch_semaphore_wait(signal, overTime);
        LGNSLog(@"需要线程同步的操作1开始");
        sleep(2);
        LGNSLog(@"需要线程同步的操作1结束");
        dispatch_semaphore_signal(signal);
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{//blk2
        sleep(1);
        dispatch_semaphore_wait(signal, overTime);
        LGNSLog(@"需要线程同步的操作2");
        dispatch_semaphore_signal(signal);
    });
    //执行顺序是blk1->blk2 关键点在于blk2的sleep(1) 进行了1秒的等待 如果把blk1和blk2的代码先后调整了输出还是blk1-blk2
}

- (void)gcdTest14 {
    //死锁
    LGNSLog(@"1");
    dispatch_sync(dispatch_get_main_queue(), ^{
        LGNSLog(@"2");
    });
    LGNSLog(@"3");
}

- (void)gcdTest15 {
    LGNSLog(@"1");
    dispatch_sync(dispatch_get_global_queue(0, 0), ^{//sync 全局队列不开启新线程 串行执行
        LGNSLog(@"2");
    });
    LGNSLog(@"3");
}

- (void)gcdTest16 {
    LGNSLog(@"1");
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{//开启新线程 并行执行 新线程晚于当前线程执行
        LGNSLog(@"2");
    });
    LGNSLog(@"3");
    //1-3-2
}

- (void)gcdTest17 {
    LGNSLog(@"1");
    dispatch_queue_t queue = dispatch_queue_create("com.demo.serialQuque", DISPATCH_QUEUE_SERIAL);
    dispatch_async(queue, ^{
        LGNSLog(@"2");
        dispatch_sync(queue, ^{
            LGNSLog(@"3");
        });
        LGNSLog(@"4");
    });
    sleep(1000);
    LGNSLog(@"5");
    //1-5-2 然后死锁 ——串行队列同步执行
}

- (void)gcdTest18 {
    LGNSLog(@"1");
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        LGNSLog(@"2");
        dispatch_sync(dispatch_get_main_queue(), ^{
            LGNSLog(@"3");
        });
        LGNSLog(@"4");
    });
    LGNSLog(@"5");
    //1-5-2-3-4 3和4的任务不在一个队列中即时用syn不会死锁 3在主队列，4在global队列 另外又因为是sync所以4要等到3执行完才执行
}

- (void)gcdTest19 {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        LGNSLog(@"1");
        dispatch_sync(dispatch_get_main_queue(), ^{
            LGNSLog(@"2");
        });
        LGNSLog(@"3");
    });
    LGNSLog(@"4");
    while (1) {

    }
    LGNSLog(@"5");
    //1-4或者4-1 ∵ while(1)死循环 5不能执行 而2追加到5之后也不能执行 而sync下3要等到2执行完成才能执行 所以2 3 4都不会执行
}

- (void)gcdTest20 {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        LGNSLog(@"1");
        [self performSelector:@selector(doTest) withObject:nil afterDelay:0];//async会创建子线程的执行 performSelector:afterDelay是个定时任务要在对应线程的runloop执行 子线程默认不开启runloop所以不执行2
        LGNSLog(@"3");
        //1-3
    });
}

- (void)gcdTest21 {
//    dispatch_queue_t myQueue = dispatch_queue_create("myQueue",DISPATCH_QUEUE_CONCURRENT);
//    dispatch_queue_t myQueue = dispatch_queue_create("myQueue", DISPATCH_QUEUE_SERIAL);
    dispatch_queue_t myQueue = dispatch_get_global_queue(0, 0);
    LGNSLog(@"thread %p, main thread:%d", [NSThread currentThread], [NSThread isMainThread]);
    dispatch_async(myQueue, ^{
        LGNSLog(@"task 1 in thread %p, main thread:%d", [NSThread currentThread], [NSThread isMainThread]);
    });
    
    dispatch_async(myQueue, ^{
//        [NSThread sleepForTimeInterval:2.0];
        LGNSLog(@"task 2 in thread %p, main thread:%d", [NSThread currentThread], [NSThread isMainThread]);
    });
    
    dispatch_sync(myQueue, ^{//会追加到主线程中执行
            LGNSLog(@"task 3 in thread %p, main thread:%d", [NSThread currentThread], [NSThread isMainThread]);
        });
    
    LGNSLog(@"end");
}

- (void)gcdTest22 {
    dispatch_async(dispatch_get_main_queue(), ^{
        NSInteger sum = 0;
        for(NSInteger i=0; i<1000000000; i++) {
            sum += i;
        }
        LGNSLog(@"1");
    });
    
    dispatch_async(dispatch_get_main_queue(), ^{
        NSInteger sum = 0;
        for(NSInteger i=0; i<100; i++) {
            sum += i;
        }
        LGNSLog(@"2");
    });
    
    LGNSLog(@"3");
    
    //执行顺序是3-1-2 对应主队列的异步执行 并不会开启新新线程 二是会在一个线程中串行执行 是个假异步
    //1和2任务追加到主队列顺序晚于3此时先执行3，然后是1 2，按照入队列先后执行
}

- (void)gcdTest23 {
    dispatch_queue_t newQueue = dispatch_queue_create("new queue", DISPATCH_QUEUE_SERIAL);
    dispatch_async(dispatch_queue_create("new queue", DISPATCH_QUEUE_SERIAL), ^{
        NSInteger sum = 0;
        for(NSInteger i=0; i<10000000000; i++) {
            sum += i;
        }
        LGNSLog(@"1");
    });
    
    dispatch_async(newQueue, ^{
        NSInteger sum = 0;
        for(NSInteger i=0; i<100; i++) {
            sum += i;
        }
        LGNSLog(@"2");
    });
    
    LGNSLog(@"3");
    
    //执行顺序是3-2-1 与gcdTest22不同 队列不是主队列 那么异步执行会开启新线程执行
    //1和2任务追加到主队列顺序晚于3此时先执行3，而1是耗时任务会结束的晚于2 所以是2-1
}

- (void)ABC {
    //实现这样的需求：A和B两个任务异步执行 C任务需要等待A任务执行完才执行
    dispatch_group_t g1 = dispatch_group_create();
    dispatch_group_async(g1, dispatch_get_global_queue(0, 0), ^{
        LGNSLog(@"A");
    });
    dispatch_group_async(g1, dispatch_get_global_queue(0, 0), ^{
        LGNSLog(@"B");
    });
    dispatch_group_wait(g1, DISPATCH_TIME_FOREVER);
    dispatch_group_async(g1, dispatch_get_global_queue(0, 0), ^{
        LGNSLog(@"C");
    });
}

@end
