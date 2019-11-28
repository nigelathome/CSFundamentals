//
//  RecBatkDivConqTopics.m
//  CSFundamentals
//
//  Created by Hui,Li on 2019/11/28.
//  Copyright © 2019 Hui,Li. All rights reserved.
//

#import "RecBatkDivConqTopics.h"

@implementation RecBatkDivConqTopics

- (NSMutableArray *)subsets:(NSArray<NSNumber *> *)nums {
    NSMutableArray *items = [[NSMutableArray alloc] init]; //记录每个子集
    NSMutableArray<NSArray<NSNumber *> *> *result = [[NSMutableArray alloc] init] ; //记录结果
    [result addObject:items]; //将空集放入result中
    [self generateSubsets:0 numArray:nums items:items result:result];
    return result;
}

- (void)generateSubsets:(NSUInteger)index
               numArray:(NSArray<NSNumber *> *)nums
                  items:(NSMutableArray *)items
                 result:(NSMutableArray<NSArray<NSNumber *> *> *)result {
    if (index == [nums count]) {
        return;
    }
    [items addObject:nums[index]];
    NSArray<NSNumber *> *currentItems = [NSArray arrayWithArray:items];
    [result addObject:currentItems];
    [self generateSubsets:index + 1 numArray:nums items:items result:result]; //加入该元素的递归调用
    [items removeLastObject];
    [self generateSubsets:index + 1 numArray:nums items:items result:result]; //不加入该元素的递归调用
}

- (void)generate:(NSUInteger)index
        numArray:(NSArray<NSNumber *> *)nums
           items:(NSMutableArray *)items
          result:(NSMutableArray<NSArray<NSNumber*> *> *)result {
    if (index == [nums count]) {
        return;
    }
    [items addObject:nums[index]];
    NSArray<NSNumber*> *currentItems = [NSArray arrayWithArray:items];
    [result addObject:currentItems];
    [self generate:index + 1 numArray:nums items:items result:result];
}

@end
