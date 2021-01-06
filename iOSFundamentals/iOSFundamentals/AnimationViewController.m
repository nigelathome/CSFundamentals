//
//  AnimationViewController.m
//  iOSFundamentals
//
//  Created by Hui,Li on 2020/12/28.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#import "AnimationViewController.h"

@interface AnimationViewController ()

@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) UIView *chunk;

@property (nonatomic, strong) CADisplayLink *displayLink;
@property (nonatomic, strong) UIView *chunk2;

@end

@implementation AnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"动画";
    
    /*
     timer创建动画
     */
    [self timerAnimationUsage];
    
    /*
     CADisplayLink动画
     */
    [self cadisplayLinkUsage];
    
    /*
     布局锚点的使用
     */
    [self layoutAnchorUsage];
}

- (void)timerAnimationUsage {
    self.chunk = [[UIView alloc] initWithFrame:CGRectMake(0, 100, 100, 100)];
    self.chunk.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:self.chunk];

    __weak typeof(self) weakSelf = self;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1/60.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if(strongSelf.chunk.frame.origin.x+100>=[UIScreen mainScreen].bounds.size.width) {
            return;
        }
        CGRect newFrame = CGRectMake(strongSelf.chunk.frame.origin.x+1, strongSelf.chunk.frame.origin.y, strongSelf.chunk.frame.size.width, strongSelf.chunk.frame.size.height);
        strongSelf.chunk.frame = newFrame;
    }];
    [self.timer fire];
}

- (void)cadisplayLinkUsage {
    self.chunk2 = [[UIView alloc] initWithFrame:CGRectMake(0, 210, 100, 100)];
    self.chunk2.backgroundColor = [UIColor magentaColor];
    [self.view addSubview:self.chunk2];
    //CADisplayLink本质是定时器 刷新频率和屏幕一致
    CADisplayLink *displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(refresh)];
    [displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
}

- (void)refresh {
    if(self.chunk2.frame.origin.x+100>=[UIScreen mainScreen].bounds.size.width) {
        return;
    }
    CGRect newFrame = CGRectMake(self.chunk2.frame.origin.x+1, self.chunk2.frame.origin.y, self.chunk2.frame.size.width, self.chunk2.frame.size.height);
    self.chunk2.frame = newFrame;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    if(self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
}

- (void)layoutAnchorUsage {
    UIView *v1 = [[UIView alloc] init];
    v1.backgroundColor = [UIColor redColor];
    v1.translatesAutoresizingMaskIntoConstraints = NO;//使用自动布局需要将其置为NO
    [self.view addSubview:v1];
    
    UIView *v2 = [[UIView alloc] init];
    v2.backgroundColor = [UIColor greenColor];
    v2.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:v2];
    
    UIView *v3 = [[UIView alloc] init];
    v3.backgroundColor = [UIColor blueColor];
    v3.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:v3];
    
    [v1.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:320].active = YES;
    [v1.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:20].active = YES;
    [v1.heightAnchor constraintEqualToConstant:100].active = YES;
    
    [v2.topAnchor constraintEqualToAnchor:v1.topAnchor].active = YES;
    [v2.bottomAnchor constraintEqualToAnchor:v1.bottomAnchor].active = YES;
    [v2.widthAnchor constraintEqualToAnchor:v1.widthAnchor].active = YES;
    [v2.leftAnchor constraintEqualToAnchor:v1.rightAnchor constant:20].active = YES;

    [v3.topAnchor constraintEqualToAnchor:v1.topAnchor].active = YES;
    [v3.bottomAnchor constraintEqualToAnchor:v1.bottomAnchor].active = YES;
    [v3.widthAnchor constraintEqualToAnchor:v1.widthAnchor].active = YES;
    [v3.leftAnchor constraintEqualToAnchor:v2.rightAnchor constant:20].active = YES;
    [v3.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:-20].active = YES;
}

@end
