//
//  ThreadKeepAliveViewController.m
//  iOSFundamentals
//
//  Created by Hui,Li on 2020/12/22.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#import "ThreadKeepAliveViewController.h"

@interface ThreadKeepAliveViewController ()

@property (nonatomic, strong) NSThread *thread;
@property (nonatomic, strong) UILabel *bulletBoard;

@end

@implementation ThreadKeepAliveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"子线程保活";
    
    _bulletBoard = [[UILabel alloc] initWithFrame:CGRectMake(50, 100, 300, 60)];
    _bulletBoard.backgroundColor = [UIColor purpleColor];
    _bulletBoard.textColor = [UIColor whiteColor];
    _bulletBoard.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_bulletBoard];
    
    self.thread = [[NSThread alloc] initWithTarget:self selector:@selector(enterThread) object:nil];
    [self.thread setName:@"监听的子线程"];
    [self.thread start];
}

- (void)enterThread {
    @autoreleasepool {
        NSRunLoop *runloop = [NSRunLoop currentRunLoop];
        //监听port端口 source1事件源
        [runloop addPort:[NSMachPort port] forMode:NSRunLoopCommonModes];
        [runloop run];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self performSelector:@selector(doSomething) onThread:self.thread withObject:nil waitUntilDone:NO];
}

- (void)doSomething {
    dispatch_async(dispatch_get_main_queue(), ^{
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"y/M/D h:m:s";
        NSString *times = [formatter stringFromDate:[NSDate date]];
        [self.bulletBoard setText:[NSString stringWithFormat:@"点击屏幕了 %@", times]];
    });
}

@end
