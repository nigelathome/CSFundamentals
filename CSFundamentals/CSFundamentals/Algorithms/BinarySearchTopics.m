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

- (NSMutableArray<NSNumber *> *)searchRange:(NSArray<NSNumber *> *)nums target:(NSInteger)target {
    NSMutableArray<NSNumber *> *range = [[NSMutableArray alloc] init];
    NSUInteger leftRange = [self searchLeftRange:nums target:target];
    NSUInteger rightRange = [self searchRightRange:nums target:target];
    [range addObject:[NSNumber numberWithInteger:leftRange]];
    [range addObject:[NSNumber numberWithInteger:rightRange]];
    return range;
}

- (NSUInteger)searchLeftRange:(NSArray<NSNumber *> *)sortArray target:(NSInteger)target {
    NSInteger begin = 0, end = [sortArray count] - 1;
    NSUInteger range = -1;
    while (begin <= end) {
        NSInteger mid = (begin + end) / 2;
        if (target == [sortArray[mid] integerValue]) {
            if (mid == 0 || target > [sortArray[mid - 1] integerValue] ) {
                range = mid;
            }
            end = mid - 1;
        } else if (target > [sortArray[mid] integerValue]) {
            begin = mid + 1;
        } else {
            end = mid - 1;
        }
    }
    return range;
}

- (NSUInteger)searchRightRange:(NSArray<NSNumber *> *)sortArray target:(NSInteger)target {
    NSInteger begin = 0, end = [sortArray count] - 1;
    NSUInteger range = -1;
    while (begin <= end) {
        NSInteger mid = (begin + end) / 2;
        if (target == [sortArray[mid] integerValue]) {
            if (mid == [sortArray count] - 1 || target < [sortArray[mid + 1] integerValue] ) {
                range = mid;
            }
            begin = mid + 1;
        } else if (target > [sortArray[mid] integerValue]) {
            begin = mid + 1;
        } else {
            end = mid - 1;
        }
    }
    return range;
}

- (NSInteger)search:(NSArray<NSNumber *> *)nums target:(NSInteger)target {
    //mid将数组分拆两个区间,一个是完全由大到小有序, 另一个一定是部分有序. 并且nums[begin] > nums[end]
    NSInteger begin = 0, end = [nums count] - 1;
    while (begin <= end) {
        NSInteger mid = (begin + end) / 2 ;
        if (target == [nums[mid] integerValue]) {
            return mid;
            
        } else if (target > [nums[mid] integerValue]) {
            //由于旋转数组的存在, 在mid的左半区可能存在target. 所以需要判断旋转区间出现在左还是右半区
            if ([nums[begin] integerValue] > [nums[mid] integerValue]) { //[4 5 1 2 3] 左半区是旋转区间
                if (target > [nums[begin] integerValue]) { //查找5, 由于nums[mid]->nums[end]递增, 而nums[begin]>nums[end], 所以只可能在左半区找
                    end = mid - 1;
                } else if (target < [nums[begin] integerValue]) { //查找2
                    begin = mid + 1;
                } else if (target == [nums[begin] integerValue]) {
                    return begin;
                }
            } else if ([nums[begin] integerValue] < [nums[mid] integerValue]) { //[2 3 4 5  1]右半区是旋转区间, 左半区一定是递增, 而target > nums[mid], 那么target一定不在左半区
                begin = mid + 1;
            } else if ([nums[begin] integerValue] == [nums[mid] integerValue]) {//[6 7]
                begin = mid + 1;
            }
            
        } else if (target < [nums[mid] integerValue]) {
            if ([nums[begin] integerValue] < [nums[mid] integerValue]) {
                // [3 4 5 6 1 2] 左半区是有序
                if (target < [nums[begin] integerValue]) { //eg查找2, 则在右半区间
                    begin = mid + 1;
                } else if (target > [nums[begin] integerValue]) { //target比nums[begin]大,又比nums[mid]小, 说明在左半区.eg查找3
                    end = mid - 1;
                } else if (target == [nums[begin] integerValue]) {
                    return begin;
                }
            } else if ([nums[begin] integerValue] > [nums[mid] integerValue]) {
                // [7 1 2 3 4 5 6] 右半区有序递增, 而target<nums[mid]所以只可能出现左半区.eg查找1
                end = mid - 1;
            } else if ([nums[begin] integerValue] == [nums[mid] integerValue]) {
                // [6 5]
                begin = mid + 1;
            }
        }
    }
    return -1;
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
 
 NSArray<NSNumber *> *test = @[@1, @3, @5, @6];
 for (NSUInteger i = 0; i < 8; i++) {
 NSInteger index = [binarySearchTopics searchInsert:test target:i];
 printf("i = %ld index = %ld\n", i, index);
 }
 */

/*
 //区间查找 (34)
 NSArray<NSNumber *> *nums = @[@5, @7, @7, @8, @8, @8, @8, @10];
 for (NSUInteger i = 0; i < 12; i++) {
 NSMutableArray<NSNumber *> *range = [binarySearchTopics searchRange:nums target:i];
 printf("%ld: [%ld, %ld]\n", i, [range[0] integerValue], [range[1] integerValue]);
 }
 */

/*
 //旋转数组查找元素 (33)
 NSArray<NSNumber *> *nums = @[@9, @12, @15, @20, @1, @3, @6, @7];
 for (NSUInteger i = 0; i < 22; i++) {
 NSInteger result = [binarySearchTopics search:nums target:i];
 printf("%ld: %ld\n", i, result);
 }
 */

/*
 //构造BST
 BST *bst = [[BST alloc] init];
 TreeNode *root = [[TreeNode alloc] initWithValue:8];
 NSArray<NSNumber *> *valArray = [NSArray arrayWithObjects:@3, @10, @1, @6, @15, nil];
 NSMutableArray *nodeArray = [[NSMutableArray alloc] init];
 [valArray enumerateObjectsUsingBlock:^(NSNumber *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
 TreeNode *node = [[TreeNode alloc] initWithValue: [obj integerValue]];
 [nodeArray addObject:node];
 }];
 [nodeArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
 [bst insertNode:obj toNode:root];
 }];
 [bTreeGraphicTopics preorderPrint:root layer:0];
 */

@end
