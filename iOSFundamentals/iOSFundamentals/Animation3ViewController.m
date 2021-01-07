//
//  Animation3ViewController.m
//  iOSFundamentals
//
//  Created by Hui,Li on 2021/1/7.
//  Copyright © 2021 Hui,Li. All rights reserved.
//

#import "Animation3ViewController.h"

@interface Animation3ViewController ()

@property (nonatomic, strong) UIImageView *imageV;

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

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    /*
    转场动画
    */
    self.imageV.image = [UIImage imageNamed:[NSString stringWithFormat:@"图册%d.jpg", rand()%5]];
    // 创建转场动画对象
    CATransition *anim = [CATransition animation];
    // 设置转场类型
    anim.type = @"pageCurl";
    // 设置动画的方向
    anim.subtype = kCATransitionFromLeft;
    anim.duration = 2;
    [self.imageV.layer addAnimation:anim forKey:nil];
}

- (UIImageView *)imageV {
    if (!_imageV) {
        _imageV = [[UIImageView alloc] initWithFrame:CGRectMake(0, self.navigationController.navigationBar.frame.size.height + 44, self.view.bounds.size.width, self.view.bounds.size.height-self.navigationController.navigationBar.frame.size.height-44)];
        [self.view addSubview:_imageV];
    }
    return _imageV;
}


@end
