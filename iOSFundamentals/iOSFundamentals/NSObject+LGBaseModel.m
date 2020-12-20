//
//  NSObject+LGBaseModel.m
//  iOSFundamentals
//
//  Created by Hui,Li on 2020/12/20.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#import "NSObject+LGBaseModel.h"
#pragma clang diagnostic ignored "-Wobjc-designated-initializers"

@implementation NSObject (LGBaseModel)

+ (instancetype)initWithDictionary:(NSDictionary *)dict {
    //1.遍历所有属性
    unsigned int outCount = 0;
    objc_property_t *properties = class_copyPropertyList([self class], &outCount);
    NSMutableArray *arr = [NSMutableArray array];
    for (int i=0; i<outCount; i++) {
        objc_property_t pro = properties[i];
        const char *cName = property_getName(pro);
        NSString *name = [NSString stringWithCString:cName encoding:NSUTF8StringEncoding];
        [arr addObject:name];
    }
    free(properties);
    
    id obj = [[self alloc] init];
    //2.KVC将dict对应的值绑定给属性
    for (NSString *key in arr) {
        if ([dict objectForKey:key] != nil) {
            [obj setValue:[dict objectForKey:key] forKey:key];
        }
    }
        
    return obj;
}

@end
