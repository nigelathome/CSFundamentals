//
//  TimerRelaseViewController.m
//  iOSFundamentals
//
//  Created by Hui,Li on 2020/12/24.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#import "TimerRelaseViewController.h"
#import "NSTimer+block.h"

@interface TimerRelaseViewController ()

@property (nonatomic, strong) NSTimer *timer;//换成weak也是不行的

@end

@implementation TimerRelaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"定时器释放";
}

- (void)viewWillDisappear:(BOOL)animated {
//    [self stopTimer];
}

- (void)startTimer {
    if (!self.timer) {
//        self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(print) userInfo:nil repeats:YES];
        __weak typeof(self) weakSelf = self;
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
            __strong typeof(weakSelf) strongSelf = weakSelf;
            [strongSelf print];
        }];
    }
}

- (void)stopTimer {
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
}

- (void)print {
    LGNSLog(@"timer task");
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //启动定时器
    [self startTimer];
}

- (void)dealloc {
    LGNSLog(@"%@ %s", [self class], __FUNCTION__);
}

@end
