//
//  singleton.h
//  iOSFundamentals
//
//  Created by Hui,Li on 2021/1/25.
//  Copyright © 2021 Hui,Li. All rights reserved.
//

/*
 封装单例
 */
#define singleton_h(Class) \
+ (instancetype)shared##Class;

#define singleton_m(Class) \
+ (instancetype)shared##Class { \
static id instance = nil; \
static dispatch_once_t onceToken; \
    dispatch_once(&onceToken, ^{ \
        instance = [[Class alloc] init]; \
    }); \
    return instance; \
} \
