//
//  LGDog.m
//  iOSFundamentals
//
//  Created by Hui,Li on 2020/12/20.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#import "LGDog.h"
#import "LGCat.h"

@implementation LGDog

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    return YES;
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    if([NSStringFromSelector(aSelector) isEqualToString:@"jump"]) {
        return [LGCat new];
    }
    return [super forwardingTargetForSelector:aSelector];
}



@end
