//
//  LGStaff.m
//  iOSFundamentals
//
//  Created by Hui,Li on 2021/3/7.
//  Copyright © 2021 Hui,Li. All rights reserved.
//

#import "LGStaff.h"

/*
 匿名分类 仅共类内部使用——（class continuation）
 */
@interface LGStaff ()

@property (nonatomic, strong) NSString *department;

@end

@implementation LGStaff

- (instancetype)init {
    self  = [super init];
    if (self) {
        self.department = @"NBA center";
    }
    return self;
}

#pragma mark - LGCompanyDelegate
- (void)developiOSAPP {
    LGNSLog(@"%@ %s", [self class], __FUNCTION__);
}

- (void)doUT {
    /*
     匿名分类定义的属性只能在该类内部使用
     */
    LGNSLog(@"匿名分类 %@", self.department);
    LGNSLog(@"%@ %s", [self class], __FUNCTION__);
}

- (void)researchNewTech {
    LGNSLog(@"%@ %s", [self class], __FUNCTION__);
}

- (void)testiOSAPP {
    LGNSLog(@"%@ %s", [self class], __FUNCTION__);
}

@end
