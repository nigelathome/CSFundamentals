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

@property (nonatomic, strong) CALayer *curLayer;
@property (nonatomic, strong) UIView *curView;

@property (nonatomic, strong) CALayer *transctionLayer;

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
    
    /*
     CALayer的使用
     */
    [self calayerUsage];
}

- (void)timerAnimationUsage {
    self.chunk = [[UIView alloc] initWithFrame:CGRectMake(0, 100, 50, 50)];
    self.chunk.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:self.chunk];

    __weak typeof(self) weakSelf = self;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1/60.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if(strongSelf.chunk.frame.origin.x+50>=[UIScreen mainScreen].bounds.size.width) {
            return;
        }
        CGRect newFrame = CGRectMake(strongSelf.chunk.frame.origin.x+1, strongSelf.chunk.frame.origin.y, strongSelf.chunk.frame.size.width, strongSelf.chunk.frame.size.height);
        strongSelf.chunk.frame = newFrame;
    }];
    [self.timer fire];
}

- (void)cadisplayLinkUsage {
    self.chunk2 = [[UIView alloc] initWithFrame:CGRectMake(0, 160, 50, 50)];
    self.chunk2.backgroundColor = [UIColor magentaColor];
    [self.view addSubview:self.chunk2];
    //CADisplayLink本质是定时器 刷新频率和屏幕一致
    CADisplayLink *displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(refresh)];
    [displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
}

- (void)refresh {
    if(self.chunk2.frame.origin.x+50>=[UIScreen mainScreen].bounds.size.width) {
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
    
    [v1.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:220].active = YES;
    [v1.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:20].active = YES;
    [v1.heightAnchor constraintEqualToConstant:50].active = YES;
    
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

- (void)calayerUsage {
    UIView *v = [[UIView alloc] initWithFrame:CGRectMake(20, 300, 50, 50)];
    v.layer.backgroundColor = [UIColor orangeColor].CGColor;
    v.layer.cornerRadius = 10.0f;
    [self.view addSubview:v];
    
    CALayer *layer = [[CALayer alloc] init];
    layer.frame = CGRectMake(0, 0, 25, 25);
    layer.backgroundColor = [UIColor yellowColor].CGColor;
    [v.layer addSublayer:layer];
    
    /*
     隐式动画 UIView的隐式动画默认关闭 CALayer隐式动画默认开启
     */
    self.curLayer = [[CALayer alloc] init];
    self.curLayer.frame = CGRectMake(20, 370, 50, 50);
    self.curLayer.backgroundColor = [UIColor purpleColor].CGColor;
    [self.view.layer addSublayer:self.curLayer];
    
    self.curView = [[UIView alloc] init];
    self.curView.frame = CGRectMake(20, 440, 50, 50);
    self.curView.backgroundColor = [UIColor brownColor];
    [self.view addSubview:self.curView];
    
    layer.beginTime = CACurrentMediaTime() + 5;//使用时空观延迟渲染
    layer.duration = 5;
    layer.speed = 2;
    
    self.curLayer.speed = 0.25;//使用时空观延迟layer动画的渲染
    
    self.transctionLayer = [[CALayer alloc] init];
    self.transctionLayer.frame = CGRectMake(20, 510, 50, 50);
    self.transctionLayer.backgroundColor = [UIColor grayColor].CGColor;
    [self.view.layer addSublayer:self.transctionLayer];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CGFloat x_po = (NSInteger)random() % ((NSInteger)UIScreen.mainScreen.bounds.size.width);//随机定义x位置
    CGRect newLayerFrame = CGRectMake(x_po, self.curLayer.frame.origin.y, self.curLayer.frame.size.width, self.curLayer.frame.size.height);
    CGRect newViewFrame = CGRectMake(x_po, self.curView.frame.origin.y, self.curView.frame.size.width, self.curView.frame.size.height);
    self.curLayer.frame = newLayerFrame;
    self.curView.frame = newViewFrame;
    
    //事务的使用 设置动画属性
    [CATransaction begin];
    [CATransaction setAnimationDuration:5];
    [CATransaction setCompletionBlock:^{
        LGNSLog(@"CATransaction finish");
    }];
    [CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
    CGRect newTransactionLayerFrame = CGRectMake(x_po, self.transctionLayer.frame.origin.y, self.transctionLayer.frame.size.width, self.transctionLayer.frame.size.height);
    self.transctionLayer.frame = newTransactionLayerFrame;
    [CATransaction commit];
}

@end
