//
//  CustomerView.m
//  iOSFundamentals
//
//  Created by Hui,Li on 2021/1/11.
//  Copyright © 2021 Hui,Li. All rights reserved.
//

#import "CustomerView.h"

@implementation CustomerView

- (void)displayLayer:(CALayer *)layer {
    layer.backgroundColor = [UIColor redColor].CGColor;
    LGNSLog(@"%@ %s", layer, __FUNCTION__);
}

//如果重写displayLayer 那么drawLayer不会调用
- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
    CGContextAddRect(ctx, CGRectMake(100, 200, 100, 100));
    CGContextSetFillColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextFillPath(ctx);
    LGNSLog(@"%s", __FUNCTION__);
}

@end
