//
//  TimerViewController.m
//  iOSFundamentals
//
//  Created by Hui,Li on 2020/12/22.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#import "TimerViewController.h"

@interface TimerViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UILabel *timerLabel;

@property (nonatomic, assign) NSUInteger count;
@property (nonatomic, strong) NSThread *thread;

@end

@implementation TimerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Runloop在Timer上运用";
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 46, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    _timerLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.center.x, 100, 100, 60)];
    _timerLabel.backgroundColor = [UIColor purpleColor];
    _timerLabel.textColor = [UIColor whiteColor];
    _timerLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_timerLabel];
    
    //runloop default模式下ScrollView滑动定时器不执行
//    [self createTimerOnMainThread];
    
    
    _thread = [[NSThread alloc] initWithTarget:self selector:@selector(createTimerOnThread) object:nil];
    [_thread start];
    
}

- (void)createTimerOnMainThread {
    NSTimer *timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(timerUpdate) userInfo:nil repeats:YES];
//    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
    LGNSLog(@"主线程runloop:%p", [NSRunLoop mainRunLoop]);
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];//commonMode会在mode切换前加入将timer要执行的mode
    [timer fire];
}

- (void)createTimerOnThread {
    @autoreleasepool {
        NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerUpdate) userInfo:nil repeats:YES];
        //需要手动启动runloop
        [[NSRunLoop currentRunLoop] run];
        //并把timer加到thread的runloop中
        [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
    }
}

- (void)timerUpdate {
    self.count++;
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.timerLabel setText:[NSString stringWithFormat:@"定时器：%ld", self.count]];
    });
    LGNSLog(@"主线程runloop地址：%p", [NSRunLoop mainRunLoop]);
    LGNSLog(@"子线程runloop地址：%p", [NSRunLoop currentRunLoop]);
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    cell.backgroundColor = [UIColor cyanColor];
    cell.textLabel.text = [NSString stringWithFormat:@"XXX-%ld", indexPath.row];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"YYY-%ld", indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

@end
