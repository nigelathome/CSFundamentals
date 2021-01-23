//
//  LGHuman.m
//  iOSFundamentals
//
//  Created by Hui,Li on 2021/1/22.
//  Copyright © 2021 Hui,Li. All rights reserved.
//

#import "LGHuman.h"

@implementation LGHuman

//重写description方法
- (NSString *)description {
    return [NSString stringWithFormat:@"<%@: %p 属性：%@>", [self class], self, @{@"age" : self.age ? @(self.age) : @0, @"gender" : self.gender ? : @""}];
}

+ (void)load {
    //main函数执行前调用实现加载
    LGNSLog(@"%p", __FUNCTION__);
}

+ (void)initialize {
    //使用该类的时候才进行调用实现加载
    LGNSLog(@"%p", __FUNCTION__);
}



@end
