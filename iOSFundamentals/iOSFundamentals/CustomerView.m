//
//  CustomerView.m
//  iOSFundamentals
//
//  Created by Hui,Li on 2021/1/11.
//  Copyright © 2021 Hui,Li. All rights reserved.
//

#import "CustomerView.h"

@implementation CustomerView

//- (void)displayLayer:(CALayer *)layer {
//    layer.backgroundColor = [UIColor redColor].CGColor;
//    LGNSLog(@"%@ %s", layer, __FUNCTION__);
//}

//如果重写displayLayer 那么drawLayer不会调用
- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
    CGContextAddRect(ctx, CGRectMake(100, 200, 100, 100));
    CGContextSetFillColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextFillPath(ctx);
    LGNSLog(@"%s", __FUNCTION__);
    
    /*
    绘制图形步骤：
    1. 设置绘制属性
    2. 定义图形
    3. 进行绘制
    */
    [self addLine:ctx];
    [self addRect:ctx];
}

- (void)addLine:(CGContextRef)ctx {
    CGContextSetLineWidth(ctx, 5);//设置属性
    
    CGContextSetStrokeColorWithColor(ctx, [UIColor blueColor].CGColor);
    CGContextMoveToPoint(ctx, 100, 100);//定义图形
    CGContextAddLineToPoint(ctx, 200, 200);
    CGContextAddLineToPoint(ctx, 200, 300);
    CGContextAddLineToPoint(ctx, 300, 100);
    
    CGContextStrokePath(ctx);//进行绘制或者填充
}

- (void)addRect:(CGContextRef)ctx {
    CGContextSetLineWidth(ctx, 3);//设置属性
    CGContextSetFillColorWithColor(ctx, [UIColor whiteColor].CGColor);
    
    CGContextAddRect(ctx, CGRectMake(100, 400, 100, 100));//定义图形
    CGContextFillPath(ctx);//进行填充
    
    CGContextAddRect(ctx, CGRectMake(100, 400, 100, 100));//需要定义两次
    CGContextSetStrokeColorWithColor(ctx, [UIColor greenColor].CGColor);//设置属性
    CGContextStrokePath(ctx);//进行绘制
}

@end
