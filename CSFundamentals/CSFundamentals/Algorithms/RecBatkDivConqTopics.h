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

//求有重复的一组数的全部子集 (90)
- (NSMutableArray *)subsetsWithDup:(NSArray<NSNumber *> *)nums;
- (void)generateSubsetsWithDup:(NSUInteger)index
                      numArray:(NSArray<NSNumber *> *)nums
                         items:(NSMutableArray *)items
                           set:(NSMutableSet *)set
                        result:(NSMutableArray<NSArray<NSNumber *> *> *)result;

//元素和等于target的不重复子集
- (NSMutableArray<NSArray<NSNumber *> *> *)combinationSum2:(NSArray<NSNumber *> *)candidates target:(NSInteger)target;
- (void)generateSubsets:(NSUInteger)index
             candidates:(NSArray<NSNumber *> *)candidates
                  items:(NSMutableArray *)items
                    set:(NSMutableSet *)set
                    sum:(NSInteger)sum
                 target:(NSInteger)target
                 result:(NSMutableArray<NSArray<NSNumber *> *> *)result;

//生成n组合法的括号
- (NSMutableArray<NSString *> *)generateParenthesis:(NSUInteger)n;

//生成n组可能的括号
- (NSMutableArray<NSString *> *)generateAllPossibleParenthesis:(NSUInteger)n;

@end

NS_ASSUME_NONNULL_END
