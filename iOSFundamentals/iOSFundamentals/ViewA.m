//
//  ViewA.m
//  iOSFundamentals
//
//  Created by Hui,Li on 2020/12/13.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#import "ViewA.h"

@implementation ViewA

- (instancetype)init {
    if(self = [super init]) {
        
    }
    return self;
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    LGNSLog(@"%s", __FUNCTION__);
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
