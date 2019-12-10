//
//  BinarySearchTopics.h
//  CSFundamentals
//
//  Created by Hui,Li on 2019/12/7.
//  Copyright © 2019 Hui,Li. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class TreeNode;

@interface BinarySearchTopics : NSObject

//二分查找 递归实现
- (BOOL)binarySearch:(NSArray<NSNumber *> *)sortArray
               begin:(NSInteger)begin
                 end:(NSInteger)end
              target:(NSInteger)target;

//二分查找 循环实现
- (BOOL)binarySearch:(NSArray<NSNumber *> *)sortArray target:(NSInteger)target;

//查找target的插入位置 (37)
- (NSInteger)searchInsert:(NSArray<NSNumber *> *)sortArray target:(NSInteger)target;

//区间查找 (34)
- (NSMutableArray<NSNumber *> *)searchRange:(NSArray<NSNumber *> *)nums target:(NSInteger)target;

//旋转数组查找元素 (33)
- (NSInteger)search:(NSArray<NSNumber *> *)nums target:(NSInteger)target;

//逆序数 (315)
- (NSMutableArray *)countSmaller:(NSArray *)nums;
- (void)BST:(TreeNode *)root insert:(TreeNode *)nums smallerCnt:(NSUInteger *)smallerCnt;

@end

//二叉排序树BST实现编码和解码 (449)
@interface Codec : NSObject

//BST编码
- (NSString *)serialize:(TreeNode *)root;

//BST解码
- (TreeNode *)deserialize:(NSString *)data;

@end

NS_ASSUME_NONNULL_END
