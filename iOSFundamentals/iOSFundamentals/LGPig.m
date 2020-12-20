//
//  LGPig.m
//  iOSFundamentals
//
//  Created by Hui,Li on 2020/12/20.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#import "LGPig.h"
#import "LGDog.h"

@implementation LGPig

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    return YES;
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    return [super forwardingTargetForSelector:aSelector];
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    if([NSStringFromSelector(aSelector) isEqualToString:@"jump"]) {
        return [NSMethodSignature signatureWithObjCTypes:"v@:@"];
    }
    return [super methodSignatureForSelector:aSelector];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
//    //1.调用其他的接受者处理
//    [anInvocation invokeWithTarget:[LGDog new]];
    
    //2.更换selector
    anInvocation.selector = @selector(fly);
    [anInvocation invokeWithTarget:self];
}

- (void)fly {
    LGNSLog(@"pig is flying");
}


@end
