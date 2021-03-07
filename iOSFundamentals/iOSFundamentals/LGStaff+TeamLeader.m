//
//  LGStaff+TeamLeader.m
//  iOSFundamentals
//
//  Created by Hui,Li on 2021/3/7.
//  Copyright © 2021 Hui,Li. All rights reserved.
//

#import "LGStaff+TeamLeader.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"

@implementation LGStaff (TeamLeader)

- (void)doTeamReport {
    LGNSLog(@"分类 %@ %s", [self class], __FUNCTION__);
}

- (void)checkTeamMemberWeeklyReport {
    LGNSLog(@"分类 %@ %s", [self class], __FUNCTION__);
}

/*
 分类和原类方法完全相同，运行期该方法会覆盖原类的方法
 */
- (void)developiOSAPP {
    LGNSLog(@"分类 %@ %s", [self class], __FUNCTION__);
}

#pragma clang diagnostic pop

@end
