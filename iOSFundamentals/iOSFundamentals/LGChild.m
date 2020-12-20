//
//  LGChild.m
//  iOSFundamentals
//
//  Created by Hui,Li on 2020/12/20.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#import "LGChild.h"

@implementation LGChild

- (void)sitdown {
    LGNSLog(@"%s", __FUNCTION__);
}

- (void)doSomething {
    [self sitdown];
    [super sitdown];
    LGNSLog(@"%@ %@", [self class], [super class]);
}

@end
