//
//  LGCat.m
//  iOSFundamentals
//
//  Created by Hui,Li on 2020/12/20.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#import "LGCat.h"

@implementation LGCat

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    if([NSStringFromSelector(sel) isEqualToString:@"jump"]) {
//        class_addMethod(self, sel, (IMP)fun_jump, "v@");
//        Method m = class_getInstanceMethod(self, @selector(down:));
//        IMP imp = method_getImplementation(m);
        class_addMethod(self, sel, (IMP)down, "i@:@");
        return YES;
    }
    return [super resolveInstanceMethod:sel];
}

void fun_jump(id self, SEL _cmd) {
    LGNSLog(@"cat is jummping");
}

int down(id self, SEL _cmd, const char *s) {
    LGNSLog(@"%s", __FUNCTION__);
    return 0;
}

@end
