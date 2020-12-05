//
//  NSMutableArray+SafeMutableArray.m
//  iOSFundamentals
//
//  Created by Hui,Li on 2020/12/5.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#import "NSMutableArray+SafeMutableArray.h"

@implementation NSMutableArray (SafeMutableArray)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class cls = NSClassFromString(@"__NSArrayM");
        SEL systemSEL = @selector(objectAtIndex:);
        SEL swizzleSEL = @selector(safeObjectAtIndex:);
        Method systemMethod = class_getInstanceMethod(cls, systemSEL);
        Method swizzleMethod = class_getInstanceMethod(cls, swizzleSEL);
        //动态添加方法
        if (class_addMethod(cls, systemSEL, method_getImplementation(swizzleMethod), method_getTypeEncoding(swizzleMethod))) {
            class_replaceMethod(cls, swizzleSEL, method_getImplementation(systemMethod), method_getTypeEncoding(swizzleMethod));
        } else {
            //动态添加不成功交换实现
            method_exchangeImplementations(systemMethod, swizzleMethod);
        }
    });
}

- (id)safeObjectAtIndex:(NSUInteger)idx {
    if (self.count > idx) {
        //地址已经交换 此时调用的是objectAtIndex:
        return [self safeObjectAtIndex:idx];
    } else {
        LGNSLog(@"数组越界");
        return nil;
    }
}

@end
