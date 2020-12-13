//
//  UIEventRespViewController.m
//  iOSFundamentals
//
//  Created by Hui,Li on 2020/12/13.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#import "UIEventRespViewController.h"
#import "ViewA.h"
#import "ViewB.h"

@interface UIEventRespViewController ()

@end

@implementation UIEventRespViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"UI响应链";
    UIView *aView = [[ViewA alloc] init];
    aView.frame = CGRectMake(60, 100, 180, 180);
    aView.backgroundColor = [UIColor cyanColor];
    UITapGestureRecognizer *tapA = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapA:)];
    [aView addGestureRecognizer:tapA];
    [self.view addSubview:aView];
    
    UIView *bView = [[ViewB alloc] init];
    bView.frame = CGRectMake(60, 60, 80, 80);
    bView.backgroundColor = [UIColor magentaColor];
    UITapGestureRecognizer *tapB = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapB:)];
    [bView addGestureRecognizer:tapB];
    [aView addSubview:bView];
}

- (void)tapA:(UIGestureRecognizer *)tapGesture {
    LGNSLog(@"%s", __FUNCTION__);
}

- (void)tapB:(UIGestureRecognizer *)tapGesture {
    LGNSLog(@"%s", __FUNCTION__);
}

@end
