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

@end

@implementation AnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"动画";
    
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

@end
