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

@end
