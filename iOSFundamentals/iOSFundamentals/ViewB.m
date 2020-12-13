//
//  ViewB.m
//  iOSFundamentals
//
//  Created by Hui,Li on 2020/12/13.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#import "ViewB.h"

@implementation ViewB

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    LGNSLog(@"%s", __FUNCTION__);
    //1 如果不允许交互 或者 透明度小于0.01 或者隐藏则不响应
    //2 判断是否pointInside 不满足则返回nil
    //3 查找当前视图的子视图从顶层下底层找能够响应的子视图 如果pointInside则返回该子视图
    //4 如果没有一个子视图pointInside 则返回自身视图
    if (!self.isUserInteractionEnabled || self.hidden || self.alpha<0.01) {
        return nil;
    }
    UIView *view = nil;
    if ([self pointInside:point withEvent:event]) {
        NSArray *subviews = [self subviews];
        for (NSInteger i=subviews.count-1; i>=0; i--) {
            CGPoint p = [self convertPoint:point toView:subviews[i]];
            view = [subviews[i] hitTest:p withEvent:event];
            if (view) {
                break;
            }
        }
        if (!view) {
            view = self;
        }
    }
    return view;
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    LGNSLog(@"%s", __FUNCTION__);
    BOOL isInside = [super pointInside:point withEvent:event];
    return isInside;
}

@end
