//
//  TimerRelaseViewController.m
//  iOSFundamentals
//
//  Created by Hui,Li on 2020/12/24.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#import "TimerRelaseViewController.h"

@interface TimerRelaseViewController ()

@property (nonatomic, strong) NSTimer *timer;

@end

@implementation TimerRelaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"定时器释放";
}

- (void)viewWillDisappear:(BOOL)animated {
    [self stopTimer];
}

- (void)startTimer {
    if (!self.timer) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(print) userInfo:nil repeats:YES];
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
