//
//  BinarySearchTopics.h
//  CSFundamentals
//
//  Created by Hui,Li on 2019/12/7.
//  Copyright © 2019 Hui,Li. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

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

@end

NS_ASSUME_NONNULL_END
