//
//  LGPatch.m
//  iOSFundamentals
//
//  Created by Hui,Li on 2020/12/20.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#import "LGPatch.h"

@implementation LGPatch

static __strong LGPatch *_patch;

+ (instancetype)sharedPatch {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _patch = [[LGPatch alloc] init];
    });
    return _patch;
}

//防止使用LGPatch的时候通过allocWithZone创建 那么将不是单例 所以要重写allocWithZone方法
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _patch = [super allocWithZone:zone];
    });
    return _patch;
}

//运行copy操作 需要实现copyWithZone方法
- (id)copyWithZone:(NSZone *)zone {
    return _patch;
}

- (void)evaluateScript:(NSString *)script {
    // script->dictionary
    // {"className": "xx", "selectorName": "xxx"}
    NSData *data = [script dataUsingEncoding:NSUTF8StringEncoding];//string->data
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];//data->dictionary
    
    NSString *className = [dict objectForKey:@"className"];
    NSString *selectorName = [dict objectForKey:@"selectorName"];
    
    unsigned int outCount = 0;
    Method _Nonnull *methods = class_copyMethodList(NSClassFromString(className), &outCount);
    for (int i=0; i<outCount; i++) {
        Method m = methods[i];
        SEL sel = method_getName(m);
        if ([NSStringFromSelector(sel) isEqualToString:selectorName]) {
            //拿到奔溃的方法做替换
            class_replaceMethod(NSClassFromString(className), sel, (IMP)targetPatchMethod, "v@:");
            break;
        }
    }
}

void targetPatchMethod(id self, SEL _cmd, const char *other) {
    LGNSLog(@"fixed crash %@ %@", self, NSStringFromSelector(_cmd));
}

@end
