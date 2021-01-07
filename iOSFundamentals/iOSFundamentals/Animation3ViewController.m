//
//  Animation3ViewController.m
//  iOSFundamentals
//
//  Created by Hui,Li on 2021/1/7.
//  Copyright © 2021 Hui,Li. All rights reserved.
//

#import "Animation3ViewController.h"

@interface Animation3ViewController ()

@end

@implementation Animation3ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"动画-3";
    
    /*
     关键帧动画
     */
    CAKeyframeAnimation *keyframeAnimation = [CAKeyframeAnimation animationWithKeyPath:@"backgroundColor"];
    keyframeAnimation.values = @[(id)UIColor.redColor.CGColor, (id)UIColor.magentaColor.CGColor, (id)UIColor.greenColor.CGColor];
    keyframeAnimation.keyTimes = @[@0, @0.3, @0.7];
    keyframeAnimation.duration = 8.0f;
    [self.view.layer addAnimation:keyframeAnimation forKey:@"keyframeAnimation"];
}


@end
