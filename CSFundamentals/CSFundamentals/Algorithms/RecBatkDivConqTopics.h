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

//元素和等于target的不重复子集 (40)
- (NSMutableArray<NSArray<NSNumber *> *> *)combinationSum2:(NSArray<NSNumber *> *)candidates target:(NSInteger)target;
- (void)generateSubsets:(NSUInteger)index
             candidates:(NSArray<NSNumber *> *)candidates
                  items:(NSMutableArray *)items
                    set:(NSMutableSet *)set
                    sum:(NSInteger)sum
                 target:(NSInteger)target
                 result:(NSMutableArray<NSArray<NSNumber *> *> *)result;

//生成n组合法的括号 (22)
- (NSMutableArray<NSString *> *)generateParenthesis:(NSUInteger)n;
- (void)generateParenthesis:(NSUInteger)n              //'()'括号的对数
                    leftCnt:(NSUInteger)leftCnt        //'('的个数
                   rightCnt:(NSUInteger)rightCnt       //')'的个数
                      items:(NSMutableString *)items   //'('和')'的组合
                     result:(NSMutableArray<NSString *> *)result;

//生成n组可能的括号
- (NSMutableArray<NSString *> *)generateAllPossibleParenthesis:(NSUInteger)n;

//归并两个有序数组 -从小到大有序
- (void)mergeTwoSortedArray:(NSArray<NSNumber *> *)arr1 andArray:(NSArray<NSNumber *> *)arr2 sortedArray:(NSMutableArray<NSNumber *> *)sortedArray;

//归并排序
- (void)mergeSort:(NSMutableArray<NSNumber *> *)nums;
@end

NS_ASSUME_NONNULL_END
