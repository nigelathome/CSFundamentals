//
//  NSArray+SafeArray.m
//  iOSFundamentals
//
//  Created by Hui,Li on 2020/12/21.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#import "NSArray+SafeArray.h"

@implementation NSArray (SafeArray)

+ (void)load {
    Method oriMethod = class_getInstanceMethod(objc_getClass("__NSArrayI"), @selector(objectAtIndexedSubscript:));
    Method newMethod = class_getInstanceMethod(objc_getClass("__NSArrayI"), @selector(myObjectAtIndexedSubscript:));
    method_exchangeImplementations(oriMethod, newMethod);
}

- (id)myObjectAtIndexedSubscript:(NSUInteger)index {
    if (index > self.count-1) {
        @try {
            return [self myObjectAtIndexedSubscript:index];
        } @catch (NSException *exception) {
            //越界打印类信息、函数信息、崩溃堆栈
            LGNSLog(@"%@ %s %@", [self class], __func__, exception.callStackSymbols);
            return nil;
        } @finally {
            LGNSLog(@"other problems");
        }
        return nil;
    } else {
        //防止死循环
        return [self myObjectAtIndexedSubscript:index];
    }
}

@end
