//
//  GreedyTopics.m
//  CSFundamentals
//
//  Created by Hui,Li on 2019/10/30.
//  Copyright © 2019 Hui,Li. All rights reserved.
//

#import "GreedyTopics.h"

@implementation GreedyTopics

- (NSUInteger)findCotentChildren:(NSArray<NSNumber*>*)g withCookies:(NSArray<NSNumber*>*)s {
    //g元素代表能满足的糖果大小,s是每个糖果的大小
    //g/s依次有小到大排序
    NSArray *contentsArray = [g sortedArrayUsingComparator:^NSComparisonResult(NSNumber*  _Nonnull obj1, NSNumber*  _Nonnull obj2) {
        NSNumber *num1 = (NSNumber*)obj1;
        NSNumber *num2 = (NSNumber*)obj2;
        if ([num1 integerValue] < [num2 integerValue]) {
            return NSOrderedAscending;
        } else {
            return NSOrderedDescending;
        }
    }];
    NSArray *candySizeArray = [s sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        NSNumber *num1 = (NSNumber*)obj1;
        NSNumber *num2 = (NSNumber*)obj2;
        if ([num1 integerValue] < [num2 integerValue]) {
            return NSOrderedAscending;
        } else {
            return NSOrderedDescending;
        }
    }];
    
    NSUInteger children = 0, candyIndex = 0;
    while (children < [contentsArray count] && candyIndex < [candySizeArray count]) {
        if ([contentsArray[children] integerValue] <= [candySizeArray[candyIndex] integerValue]){
            children++;
        }
        candyIndex++;
    }
    return children;
}

- (NSUInteger)wiggleMaxLength:(NSArray<NSNumber*>*)nums {
    if ([nums count] < 2) {
        return [nums count];
    }
    
    STATE state = BEGIN;
    NSUInteger maxLength = 1;
    
    for (NSInteger i = 1; i < [nums count]; i++) {
        switch (state) {
            case BEGIN:
                if ([nums[i] integerValue] > [nums[i-1] integerValue]) {
                    state = UP;
                    maxLength++;
                } else if ([nums[i] integerValue] < [nums[i-1] integerValue]) {
                    state = DOWN;
                    maxLength++;
                }
                break;
            case UP:
                if ([nums[i] integerValue] < [nums[i-1] integerValue]) {
                    state = DOWN;
                    maxLength++;
                }
                break;
            case DOWN:
                if ([nums[i] integerValue] > [nums[i-1] integerValue]) {
                    state = UP;
                    maxLength++;
                }
                break;
            default:
                break;
        }
    }
    return maxLength;
}

#pragma mark test-code
/*
 GreedyTopics *greedyTopics = [GreedyTopics new];
 NSArray *g = @[@5, @10, @2, @9, @15, @9];
 NSArray *s = @[@6, @1, @20, @3, @8];
 NSUInteger count = [greedyTopics findCotentChildren:g withCookies:s];
 NSLog(@"%ld", count);
 */

@end
