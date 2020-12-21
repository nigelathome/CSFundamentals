//
//  UIViewController+EventTracking.m
//  iOSFundamentals
//
//  Created by Hui,Li on 2020/12/21.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#import "UIViewController+EventTracking.h"

@implementation UIViewController (EventTracking)

+ (void)load {
    Method orignateMethod = class_getInstanceMethod([self class], @selector(viewDidLoad));
    Method newMethod = class_getInstanceMethod([self class], @selector(myViewDidLoad));
    method_exchangeImplementations(orignateMethod, newMethod);
}

- (void)myViewDidLoad {
    if ([NSStringFromClass([self class]) containsString:@"UI"]) {
        //类名中包含UI的才上报 具体业务逻辑可自定义
        LGNSLog(@"埋点上报 曝光页面 :%@", [self class]);
    }
    
    //调用之前的viewDidLoad保持之前的逻辑 这里因为方法已经交换 viewDidLoad的实现是myViewDidLoad 注意不能死循环
    [self myViewDidLoad];
}

@end
