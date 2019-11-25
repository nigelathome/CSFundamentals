//
//  GreedyTopics.h
//  CSFundamentals
//
//  Created by Hui,Li on 2019/10/30.
//  Copyright © 2019 Hui,Li. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GreedyTopics : NSObject

//分糖果assign cookies (445)
- (NSUInteger)findCotentChildren:(NSArray<NSNumber*>*)g withCookies:(NSArray<NSNumber*>*)s;

//最长的摇摆子序列 (376)
typedef NS_ENUM (NSInteger, STATE) {//定义字符变化的状态机
    BEGIN,
    UP,
    DOWN
};
- (NSUInteger)wiggleMaxLength:(NSArray<NSNumber*>*)nums;

//移除k个数字使得整数的值最小 (402)
- (NSMutableString *)removeKdigitsFrom:(NSString*)nums withK:(NSUInteger)k;

@end

NS_ASSUME_NONNULL_END