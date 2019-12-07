//
//  BinarySearchTopics.m
//  CSFundamentals
//
//  Created by Hui,Li on 2019/12/7.
//  Copyright © 2019 Hui,Li. All rights reserved.
//

#import "BinarySearchTopics.h"

@implementation BinarySearchTopics

- (BOOL)binarySearch:(NSArray<NSNumber *> *)sortArray
               begin:(NSInteger)begin
                 end:(NSInteger)end
              target:(NSInteger)target {
    if (begin > end) {
        return NO;
    }
    NSUInteger mid = (begin + end) / 2;
    if ([sortArray[mid] integerValue] == target) {
        return YES;
    } else if ([sortArray[mid] integerValue] < target) {
        return [self binarySearch:sortArray begin:mid + 1 end:end target:target];
    } else {
        return [self binarySearch:sortArray begin:begin end:mid - 1 target:target];
    }
}

- (BOOL)binarySearch:(NSArray<NSNumber *> *)sortArray target:(NSInteger)target {
    if ([sortArray count] < 0) {
        return NO;
    }
    NSUInteger begin = 0, end = [sortArray count] - 1;
    while (begin <= end) {
        NSUInteger mid = (begin + end) / 2;
        if ([sortArray[mid] integerValue] == target) {
            return YES;
        } else if ([sortArray[mid] integerValue] < target) {
            begin = mid + 1;
        } else {
            end = mid - 1;
        }
    }
    return NO;
}

- (NSInteger)searchInsert:(NSArray<NSNumber *> *)sortArray target:(NSInteger)target {
    NSInteger index = -1; //保存插入的位置
    NSInteger begin = 0, end = [sortArray count] - 1;
    //在从小到大的有序数组中, 查找target的插入位置
    while (index == -1) {
        NSInteger mid = (begin + end) / 2;
        if (target == [sortArray[mid] integerValue]) {
            index = mid;
        } else if (target > [sortArray[mid] integerValue]) {
            if (mid == [sortArray count] - 1 || target < [sortArray[mid + 1] integerValue]) {
                index = mid + 1;
            }
            begin = mid + 1;
        } else if (target < [sortArray[mid] integerValue]) {
            if (mid == 0 || target > [sortArray[mid - 1] integerValue]) {
                index = mid;
            }
            end = mid - 1;
        }
    }
    return index;
}

#pragma mark test-code
/*
 //二分查找
 BinarySearchTopics *binarySearchTopics = [[BinarySearchTopics alloc] init];
 
 NSArray<NSNumber *> *A = @[@(-1), @2, @5, @20, @90, @100, @207, @800];
 NSArray<NSNumber *> *B = @[@50, @90, @3, @(-1), @207, @800];
 NSInteger target = 202;
 BOOL result = [binarySearchTopics binarySearch:A begin:0 end:[A count] - 1 target:target];
 NSLog(@"%@ %ld", result ? @"找到" : @"没有找到", target);
 result = [binarySearchTopics binarySearch:A target:target];
 NSLog(@"%@ %ld", result ? @"找到" : @"没有找到", target);
 */

@end
