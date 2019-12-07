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

@end
