//
//  LGPerson.m
//  iOSFundamentals
//
//  Created by Hui,Li on 2020/11/25.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#import "LGPerson.h"

@interface LGPerson () {
    NSString *_secret;
}

@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSString *pName;

@end

@implementation LGPerson

- (void)print {
//    NSLog(@"%@", self.name);//self.name指向ClassObjectViewController的isa指针 所以输出是ClassObjectViewController
}

//动态解析流程
+ (BOOL)resolveInstanceMethod:(SEL)sel {
    if (sel == @selector(func)) {
//        Method m = class_getInstanceMethod(self, @selector(myFunc));
//        IMP imp = method_getImplementation(m);
//        class_addMethod(self, @selector(func), imp, "v@:");
        return YES;
    } else {
        return [super resolveInstanceMethod:sel];
    }
}

//消息转发
- (id)forwardingTargetForSelector:(SEL)sel {
    if(sel == @selector(func)) {
//        return [ViewB new];
        return nil;
    }
    return [super forwardingTargetForSelector:sel];
}

//方法签名
- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    if (sel == @selector(func)) {
        LGNSLog(@"%s", __FUNCTION__);
        //^代表返回值为空 @代表第一个参数是id类型 :代表方法名
        return [NSMethodSignature signatureWithObjCTypes:"^@:"];
    } else {
        return [super methodSignatureForSelector:sel];
    }
}

//解析到其他方法
- (void)forwardInvocation:(NSInvocation *)anInvocation {
    NSLog(@"%s", __FUNCTION__);
//    Method m = class_getInstanceMethod([self class], @selector(myFunc));
//    IMP imp = method_getImplementation(m);
//    class_addMethod([self class], @selector(func), imp, "v@:");
//    [anInvocation invokeWithTarget:self];
    
//    [anInvocation invokeWithTarget:[ViewB class]];
    [anInvocation invokeWithTarget:[ViewB new]];
}

- (void)myFunc {
    NSLog(@"%s", __FUNCTION__);
}

@end
