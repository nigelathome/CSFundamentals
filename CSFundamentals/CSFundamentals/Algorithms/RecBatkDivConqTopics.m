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

- (NSMutableArray *)subsetsWithDup:(NSArray<NSNumber *> *)nums {
    if (0 == [nums count]) { //返回空集
        return [[NSMutableArray alloc] init];
    }
    //对nums排序以避免出现[2 1 2 2]子集是[1 2 2] [2 1 2]重复的情况
    NSArray<NSNumber *> *sortedNums = [nums sortedArrayUsingComparator:^NSComparisonResult(NSNumber * _Nonnull obj1, NSNumber * _Nonnull obj2) {
        if ([obj1 integerValue] < [obj2 integerValue]) {
            return NSOrderedAscending;
        } else {
            return NSOrderedDescending;
        }
    }];
    
    NSMutableArray<NSArray<NSNumber *> *> *result = [[NSMutableArray alloc] init] ; //记录结果
    NSMutableArray *items = [[NSMutableArray alloc] init]; //记录每个可能的子集
    [result addObject:items]; //加入空集
    NSMutableSet *set = [[NSMutableSet alloc] init]; //用了判断是否是重复的子集 例如[1 2 2]和[1 2 2]u取自不同的2,但是同一个子集
    [self generateSubsetsWithDup:0 numArray:sortedNums items:items set:set result:result];
    return result;
}

- (void)generateSubsetsWithDup:(NSUInteger)index
                      numArray:(NSArray<NSNumber *> *)nums
                         items:(NSMutableArray *)items
                           set:(NSMutableSet *)set
                        result:(NSMutableArray<NSArray<NSNumber *> *> *)result {
    if (index == [nums count]) {
        return;
    }
    [items addObject:nums[index]];
    NSArray *currentItems = [NSArray arrayWithArray:items];
    
    if (![set containsObject:currentItems]) {//判断是否是重复的子集, 不重复才添加
        [set addObject:currentItems];
        [result addObject:currentItems];
    }
    
    [self generateSubsetsWithDup:index + 1 numArray:nums items:items set:set result:result];
    
    [items removeLastObject]; //弹出nums[index]后再进行递归
    [self generateSubsetsWithDup:index + 1 numArray:nums items:items set:set result:result];
}

#pragma mark test-code
/*
 //求无重复的一组数的全部子集 (78)
 NSArray<NSNumber *> *nums = [NSArray arrayWithObjects:@1, @2, @3, nil];
 NSMutableArray *items = [[NSMutableArray alloc] init];
 NSMutableArray *result = [recBatkDivConqTopics subsets:nums];
 
 [result enumerateObjectsUsingBlock:^(NSArray *  _Nonnull items, NSUInteger idx, BOOL * _Nonnull stop) {
 if (0 == [items count]) {
 printf("[]\n");
 }
 [items enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
 printf("[%ld]", (long)[obj integerValue]);
 if ([items count] - 1 == idx) {
 printf("\n");
 }
 }];
 }];
 */

@end
