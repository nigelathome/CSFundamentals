//
//  Animation2ViewController.m
//  iOSFundamentals
//
//  Created by Hui,Li on 2021/1/7.
//  Copyright © 2021 Hui,Li. All rights reserved.
//
#import "Animation2ViewController.h"

@interface Animation2ViewController ()

@end

@implementation Animation2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"CALayer子类的应用";;
    
    /*
     粒子动画
     */
//    [self emitterLayer];
    
    /*
     渐变动画
     */
//    [self gradientLayer];
    
    /*
     复制动画
     */
//    [self replicatorLayer];
    
    /*
     形状动画
     */
    [self shapeLayer];
}

- (void)emitterLayer {
    CAEmitterLayer *layer = [[CAEmitterLayer alloc] init];
    layer.bounds = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    layer.anchorPoint = CGPointMake(0, 0);
    layer.backgroundColor = [UIColor blackColor].CGColor;
    layer.emitterPosition = CGPointMake(self.view.bounds.size.width/2, self.view.bounds.size.height/2);//发射源的发射位置
    layer.renderMode = kCAEmitterLayerUnordered;//渲染模式 追加
    layer.birthRate = 4;//粒子生成的速率
    layer.emitterSize = CGSizeMake(5, 5);//粒子大小
    
    CAEmitterCell *cell = [[CAEmitterCell alloc] init];//配置粒子的属性
    cell.emissionLatitude = (CGFloat)(-M_PI_2);//发射角度 z轴
    cell.emissionLongitude = 0; //发射角度 x-y平面
    cell.contents = (id)([UIImage imageNamed:@"粒子.png"].CGImage);//粒子的图片
    cell.lifetime = 3.0;//粒子存在时间
    cell.birthRate = 20;//粒子生成速率
    cell.velocity = 200;//粒子竖直方向速度
    cell.velocityRange = 100;//速度随机区间
    cell.yAcceleration = 25;//y轴方向加速度
    cell.emissionRange = (CGFloat)(M_PI_4);//发射角度随机区间

    layer.emitterCells = @[cell];
    [self.view.layer addSublayer:layer];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 88, 100, 30)];
    label.text = @"粒子动画";
    label.font = [UIFont systemFontOfSize:14];
    label.textColor = [UIColor whiteColor];
    [self.view addSubview:label];
}

- (void)gradientLayer {
    CAGradientLayer *layer = [[CAGradientLayer alloc] init];
    layer.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    layer.colors = @[(id)UIColor.redColor.CGColor, (id)UIColor.greenColor.CGColor, (id)UIColor.blueColor.CGColor];
    layer.locations = @[@0.2, @0.5, @0.8];
    //渐变从左上角->右下角
    layer.startPoint = CGPointMake(0, 0);
    layer.endPoint = CGPointMake(1, 1);
    
    //渐变从上->下
//    layer.startPoint = CGPointMake(0, 0);
//    layer.endPoint = CGPointMake(0, 1);
    [self.view.layer addSublayer:layer];
}

- (void)replicatorLayer {
    CAReplicatorLayer *layer = [[CAReplicatorLayer alloc] init];
    layer.frame = CGRectMake(0, 100, self.view.bounds.size.width, self.view.bounds.size.height);
    layer.instanceCount = 8;//复制图层的个数
    layer.instanceTransform = CATransform3DMakeTranslation(40, 40, 0);//每个图层的3D变换
    layer.instanceColor = UIColor.cyanColor.CGColor;//颜色
    layer.instanceBlueOffset = -0.1;//颜色偏移
    
    CALayer *ins = [[CALayer alloc] init];
    ins.frame = CGRectMake(0, 0, 100, 100);
    ins.backgroundColor = UIColor.whiteColor.CGColor;
    [layer addSublayer:ins];
    [self.view.layer addSublayer:layer];
}

- (void)shapeLayer {
    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
    layer.frame = CGRectMake(0, 100, self.view.bounds.size.width, self.view.bounds.size.height);
    layer.fillColor = [UIColor greenColor].CGColor;//填充色
    layer.lineWidth = 3;//线宽
    layer.strokeColor = UIColor.redColor.CGColor;//线条颜色
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:layer.position radius:100 startAngle:0 endAngle:(CGFloat)(M_PI * 2) clockwise:YES];
    layer.path = path.CGPath;
    
    layer.position = self.view.center;
    [self.view.layer addSublayer:layer];
}

@end
