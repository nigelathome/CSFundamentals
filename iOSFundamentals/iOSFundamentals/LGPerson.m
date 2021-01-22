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
    NSString *_location;
}

@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSString *pName;

@end

@implementation LGPerson

- (instancetype)init {
    if (self = [super init]) {
        _secret = @"这是个秘密";
        _name = @"这是个名字";
    }
    return self;
}

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

#pragma mark - NSCoding method
- (void)encodeWithCoder:(nonnull NSCoder *)coder {
    unsigned int cnt = 0;
    Ivar *ivars = class_copyIvarList([self class], &cnt);
    for(int i=0; i<cnt; i++) {
        Ivar var = ivars[i];
        const char *name = ivar_getName(var);
        NSString *key = [NSString stringWithUTF8String:name];
        [coder encodeObject:[self valueForKey:key] forKey:key];//KVC拿到成员变量的值
    }
    free(ivars);
}

- (nullable instancetype)initWithCoder:(nonnull NSCoder *)coder {
    if (self = [super init]) {
        unsigned int cnt = 0;
        Ivar *ivars = class_copyIvarList([self class], &cnt);
        for(int i=0; i<cnt; i++) {
            Ivar var = ivars[i];
            const char *name = ivar_getName(var);
            NSString *key = [NSString stringWithUTF8String:name];
            [self setValue:[coder decodeObjectForKey:key] forKey:key];//KVC拿到成员变量的值并赋值
        }
        free(ivars);
    }
    return self;
}

- (void)run {
    LGNSLog(@"%s", __FUNCTION__);
    LGNSLog(@"%@", [self class]);
    LGNSLog(@"%@", [super class]);
}

@dynamic location;
- (NSString *)location {
    if (nil == _location) {
        _location = @"";
    }
    return _location;
}

- (void)setLocation:(NSString *)location {
    if (_location != location) {
        _location = nil;
        _location = [location copy];
    }
}

@end
