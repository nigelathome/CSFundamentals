//
//  LGFather.m
//  iOSFundamentals
//
//  Created by Hui,Li on 2020/12/20.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#import "LGFather.h"

@implementation LGFather

- (void)sitdown {
    LGNSLog(@"%s", __FUNCTION__);
}

/*
 实现对象的copy 需要实现NSCopying的copyWithZone方法
 */
- (id)copyWithZone:(nullable NSZone *)zone {
    LGFather *f = [self.class allocWithZone:zone];//深拷贝
    f.money = self.money;
    return f;
}

@end
