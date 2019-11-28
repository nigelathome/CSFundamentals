//
//  RecBatkDivConqTopics.h
//  CSFundamentals
//
//  Created by Hui,Li on 2019/11/28.
//  Copyright © 2019 Hui,Li. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RecBatkDivConqTopics : NSObject

//求无重复的一组数的全部子集 (78)
- (NSMutableArray *)subsets:(NSArray<NSNumber *> *)nums;
- (void)generateSubsets:(NSUInteger)index
        numArray:(NSArray<NSNumber *> *)nums
           items:(NSMutableArray *)items
          result:(NSMutableArray<NSArray<NSNumber *> *> *)result;

//获取数组[1,2,3]的子集[1] [1,2] [1,2,3]
- (void)generate:(NSUInteger)index
        numArray:(NSArray<NSNumber *> *)nums
           items:(NSMutableArray *)items
          result:(NSMutableArray<NSArray<NSNumber *> *> *)result;

@end

NS_ASSUME_NONNULL_END
