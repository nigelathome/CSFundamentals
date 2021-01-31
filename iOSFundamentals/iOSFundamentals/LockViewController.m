//
//  LockViewController.m
//  iOSFundamentals
//
//  Created by Hui,Li on 2021/1/31.
//  Copyright © 2021 Hui,Li. All rights reserved.
//

#import "LockViewController.h"
#import "pthread.h"
#import <libkern/OSAtomic.h>

#pragma clang diagnostic ignored "-Wdeprecated-declarations"

static const double kRepeatCount = 1024 * 1024 * 24;

@interface LockViewController ()

@end

@implementation LockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"常见锁的使用";
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 170, self.view.frame.size.width, 40)];
    [label setText:@"耗时统计见控制台输出"];
    [label setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:label];
    /*
     iOS常见锁的使用和耗时情况
     */
    [self usageOfLock];
}

- (void)usageOfLock {
    double then, now;//记录耗时时间（s)
    // 1. 同步锁@synchronize
    id obj = [[NSObject alloc] init];
    then = CFAbsoluteTimeGetCurrent();
    for (NSInteger i=0; i<kRepeatCount; i++) {
        @synchronized (obj) {
            //TODO
        }
    }
    now = CFAbsoluteTimeGetCurrent();
    printf("@synchronize %f sec\n", now-then);
    
    // 2. 互斥锁NSLock
    NSLock *myLock = [NSLock new];
    then = CFAbsoluteTimeGetCurrent();
    for (NSInteger i=0; i<kRepeatCount; i++) {
        [myLock lock];
        //TODO
        [myLock unlock];
    }
    now = CFAbsoluteTimeGetCurrent();
    printf("NSLock %f sec\n", now-then);
    
    // 3. 互斥锁pthread_mutex_t
    pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;
    then = CFAbsoluteTimeGetCurrent();
    for (NSInteger i=0; i<kRepeatCount; i++) {
        pthread_mutex_lock(&mutex);
        //TODO
        pthread_mutex_unlock(&mutex);
    }
    now = CFAbsoluteTimeGetCurrent();
    printf("pthread_mutex %f sec\n", now-then);
    
    // 4. 自旋锁OSSpinLock
    OSSpinLock spinLock = OS_SPINLOCK_INIT;
    then = CFAbsoluteTimeGetCurrent();
    for (NSInteger i=0; i<kRepeatCount; i++) {
        OSSpinLockLock(&spinLock);
        //TODO
        OSSpinLockUnlock(&spinLock);
    }
    now = CFAbsoluteTimeGetCurrent();
    printf("OSSpinLock %f sec\n", now-then);
    
    // 5. GCD semaphore
    dispatch_semaphore_t signal = dispatch_semaphore_create(1);
    then = CFAbsoluteTimeGetCurrent();
    for (NSInteger i=0; i<kRepeatCount; i++) {
        dispatch_semaphore_wait(signal, DISPATCH_TIME_FOREVER);
        //TODO
        dispatch_semaphore_signal(signal);
    }
    now = CFAbsoluteTimeGetCurrent();
    printf("dispatch_semaphore_t %f sec\n", now-then);
    
    // 6. 递归锁NSRecursiveLock
    NSRecursiveLock *recursiveLock = [NSRecursiveLock new];
    then = CFAbsoluteTimeGetCurrent();
    for (NSInteger i=0; i<kRepeatCount; i++) {
        [recursiveLock lock];
        //TODO
        [recursiveLock unlock];
    }
    now = CFAbsoluteTimeGetCurrent();
    printf("NSRecursiveLock %f sec\n", now-then);
    
    // 7. 条件锁NSConditionLock
    NSConditionLock *conditionLock = [NSConditionLock new];
    then = CFAbsoluteTimeGetCurrent();
    for (NSInteger i=0; i<kRepeatCount; i++) {
        [conditionLock lock];
        //TODO
        [conditionLock unlock];
    }
    now = CFAbsoluteTimeGetCurrent();
    printf("NSConditionLock %f sec\n", now-then);
    
    /*
     @synchronize 2.553023 sec
     NSLock 0.542577 sec
     pthread_mutex 0.508371 sec
     OSSpinLock 0.202002 sec
     dispatch_semaphore_t 0.362116 sec
     NSRecursiveLock 1.070630 sec
     NSConditionLock 1.742298 sec
     耗时从小到大依次是：OSSpinLock < dispatch_semaphore_t < pthread_mutex < NSLock < NSRecursiveLock < NSConditionLock < @synchronize
     */
}

@end
