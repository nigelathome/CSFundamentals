//
//  RunloopViewController.m
//  iOSFundamentals
//
//  Created by Hui,Li on 2020/11/22.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#import "RunloopViewController.h"

@interface RunloopViewController ()

@property(nonatomic, strong, readwrite) NSThread * myThread;
@property(nonatomic, assign, readwrite) double currentTime;

@end

@implementation RunloopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    NSThread thread = [[NSThread alloc] initWithTarget:self selector:@selector(print) object:nil];
//    [self performSelector:@selector(print) onThread:thread withObject:nil waitUntilDone:NO];
//    [self.thread start];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(self.view.center.x, self.view.center.y, 130, 130)];
    label.text = @"点击屏幕";
    [self.view addSubview:label];
    [self runThread];
    [self checkMainThread];
}

- (void)runThread {
    self.myThread = [[NSThread alloc] initWithTarget:self selector:@selector(onThread) object:nil];
    [self.myThread start];
}

//给子线程添加runloop
- (void)onThread {
    [[NSRunLoop currentRunLoop] addPort:[NSPort new] forMode:NSDefaultRunLoopMode];
    [[NSRunLoop currentRunLoop] run];
}

- (void)print {
    NSLog(@"这里");
    NSRunLoop *runloop = [NSRunLoop currentRunLoop];
//    [runloop run];
    NSLog(@"那里");
}

- (void)doTask {
    LGNSLog(@"%s", __FUNCTION__);
    usleep(17000);
}

//子线程中执行任务 但不需要每次执行完之后就销毁线程 通过runloop实现线程保活
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self performSelector:@selector(doTask) onThread:self.myThread withObject:nil waitUntilDone:NO];
    [self performSelectorOnMainThread:@selector(doTask) withObject:nil waitUntilDone:NO];
}

#pragma mark - 检测主线程卡顿
- (void)checkMainThread {
    [self addObserve];
}

- (void)addObserve {
    CFRunLoopObserverContext context = {
        0,
        (__bridge void*)self,
        NULL,
        NULL
    };
    //创建runloop观察者 配置回调 观察的活动
    CFRunLoopObserverRef observer = CFRunLoopObserverCreate(kCFAllocatorDefault, kCFRunLoopAllActivities, YES, 0, runLoopObserverCallback, &context);
    //加入主线程runloop进行观察
    CFRunLoopAddObserver(CFRunLoopGetMain(), observer, kCFRunLoopDefaultMode);
    CFRelease(observer);
}

static void runLoopObserverCallback(CFRunLoopObserverRef observer, CFRunLoopActivity activity, void * info) {
    //记录唤醒的时间到下次准备进入睡眠的时间 比较这个runloop时间和1/60s 刷新时间的关系
    RunloopViewController *Self = (__bridge RunloopViewController *)info;
    if (activity == kCFRunLoopAfterWaiting) { //从睡眠中唤醒
        Self.currentTime = [Self getTimeStamp];
    } else if (activity == kCFRunLoopBeforeWaiting) { //准备睡眠
        float interval = [Self getTimeStamp] - Self.currentTime;
        LGNSLog(@"runloop循环用时：%f s", interval);
        if (interval > 0.017f) {
            LGNSLog(@"出现卡顿");
        }
    }
}

- (double)getTimeStamp {
    return [[NSDate date] timeIntervalSince1970];
}


@end
