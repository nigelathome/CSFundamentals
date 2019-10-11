//
//  StringTopics.m
//  CSFundamentals
//
//  Created by Hui,Li on 2019/10/10.
//  Copyright © 2019 Hui,Li. All rights reserved.
//

#import "StringTopics.h"

@implementation StringTopics

- (NSString *)compress:(NSString *)inputString {
    NSMutableDictionary *dict = [NSMutableDictionary new];
    NSMutableString *result = [NSMutableString new];
    
    for (NSInteger i=0; i<inputString.length; i++) {
        unichar letter = [inputString characterAtIndex:i];
        NSString *key = [NSString stringWithFormat:@"%c", letter];
        if([[dict allKeys] containsObject:key]){
            // key存在
            NSNumber *countObj = [dict objectForKey:key];
            NSInteger currentCount = [countObj integerValue];
            [dict setObject:[NSNumber numberWithInteger:++currentCount] forKey:key];
        } else {
            [dict setObject:[NSNumber numberWithInteger:1] forKey:key];
        }
    }
    
    [dict enumerateKeysAndObjectsWithOptions:NSEnumerationReverse usingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [result appendString:[NSString stringWithFormat:@"%@%@", key, obj]];
    }];
    
    return result;
}

@end
