//
//  LGSon.m
//  iOSFundamentals
//
//  Created by Hui,Li on 2021/1/18.
//  Copyright © 2021 Hui,Li. All rights reserved.
//

#import "LGSon.h"

@implementation LGSon

- (id)copyWithZone:(nullable NSZone *)zone {
    LGSon *s = [super copyWithZone:zone];
    s.age = self.age;
    s.height = self.height;
    s.hobbies = self.hobbies;
    return s;
}

@end
