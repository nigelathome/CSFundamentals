//
//  LGImageLoader.m
//  iOSFundamentals
//
//  Created by Hui,Li on 2020/12/23.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#import "LGImageLoader.h"

#define TASK_MAX_COUNT  30

@interface LGImageLoader ()

@property (strong, nonatomic) NSMutableArray<TaskBlock> *tasks;//保存待加载的任务

@end

@implementation LGImageLoader 

static __strong LGImageLoader *_instance = nil;

+ (instancetype)shareInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[LGImageLoader alloc] init];
        [self loadObserver:_instance];
    });
    return _instance;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super allocWithZone:zone];
        [self loadObserver:_instance];
    });
    return _instance;
}

- (id)copyWithZone:(NSZone *)zone {
    return _instance;
}

- (instancetype)init { //单例出来的对象也会经过init
    if (self = [super init]) {
    }
    return self;
}

+ (void)loadObserver:(LGImageLoader *)loader {
    //创建观察者
    CFRunLoopObserverContext context = {
        0,
        (__bridge void *)loader,
        &CFRetain,
        &CFRelease,
        NULL
    };
    CFRunLoopObserverRef observer = CFRunLoopObserverCreate(kCFAllocatorDefault, kCFRunLoopBeforeWaiting, YES, NSIntegerMax-999, runLoopObserverCallBack, &context);
    CFRunLoopAddObserver(CFRunLoopGetMain(), observer, kCFRunLoopCommonModes);
    CFRelease(observer);
}

static void runLoopObserverCallBack(CFRunLoopObserverRef observer, CFRunLoopActivity activity, void *info) {
    LGImageLoader *imageLoader = (__bridge LGImageLoader *)info;
    if (imageLoader.tasks.count != 0) {
        BOOL isFinished = NO;
        while (isFinished == NO && imageLoader.tasks.count > 0) {//任务没有执行完成才进行执行
            TaskBlock task = imageLoader.tasks.firstObject;
            isFinished = task();            
        }
        //移除任务
        [imageLoader.tasks removeObjectAtIndex:0];
    }
}

- (void)addTask:(TaskBlock)taskBlock {
    if (self.tasks.count > TASK_MAX_COUNT) {
        [self.tasks removeObjectAtIndex:0];
    }
    [self.tasks addObject:taskBlock];
}

#pragma mark - lazy load
- (NSMutableArray *)tasks {
    if (!_tasks) {
        _tasks = [NSMutableArray array];
    }
    return _tasks;
}

@end
