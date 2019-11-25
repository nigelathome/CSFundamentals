//
//  GreedyTopics.m
//  CSFundamentals
//
//  Created by Hui,Li on 2019/10/30.
//  Copyright © 2019 Hui,Li. All rights reserved.
//

#import "GreedyTopics.h"
#import "Stack.h"
#import "Queue.h"

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

- (NSMutableString *)removeKdigitsFrom:(NSString*)nums withK:(NSUInteger)k {
    Stack *stack = [Stack new];
    NSMutableString *result = [NSMutableString new];
    
    for (NSUInteger i = 0; i < nums.length; i++) {
        unichar digit = [nums characterAtIndex:i];
        NSUInteger num = digit - '0';//ASCII数字->int
        
        while (![stack empty] && k) {//k不等于0并且栈不空的时候，依次删除比当前数字大数字，即高位的数字
            NSUInteger stackTopNum = [(NSString *)[stack top] characterAtIndex:0] - '0';
            if (stackTopNum > num) {
                [stack pop];
                k--;
            } else {
                break;
            }
        }
        
        if (![stack empty] || num != 0) {//加入元素, 栈空则不加入0元素
            [stack push:[NSString stringWithFormat:@"%c", digit]];
        }
    }
    
    while (![stack empty] && k) {//k还不为0，即还有删除的机会，则把低位的k个数字删除
        [stack pop];
        k--;
    }
    
    [stack enumerateObjectsFromBottom:^(id obj) {
        [result appendString:(NSString*)obj];
    }];
        
    return result;
}

#pragma mark test-code
/*
 445分糖果
 GreedyTopics *greedyTopics = [GreedyTopics new];
 NSArray *g = @[@5, @10, @2, @9, @15, @9];
 NSArray *s = @[@6, @1, @20, @3, @8];
 NSUInteger count = [greedyTopics findCotentChildren:g withCookies:s];
 NSLog(@"%ld", count);
 */

/*
 376摇摆子序列
 //        NSArray<NSNumber*> *nums = @[@1, @17, @5, @10, @13, @15, @10, @5, @16, @8];
 //        NSArray<NSNumber*> *nums = @[@1, @7, @4, @9, @2, @5];
 //        NSArray<NSNumber*> *nums = @[@1, @4, @7, @2, @5];
 NSArray<NSNumber*> *nums = @[@1, @7, @4, @5, @5];
 NSUInteger maxLength = [greedyTopics wiggleMaxLength:nums];
 NSLog(@"%ld", maxLength);
 */
 

@end
