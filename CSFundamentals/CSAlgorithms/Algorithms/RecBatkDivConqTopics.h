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

//求逆序数 (315)
- (NSMutableArray<NSNumber *> *)countSmaller:(NSArray<NSNumber *> *)nums;
typedef struct {
    NSInteger value; //元素的值
    NSUInteger index; //该元素在数组中的下标
} ArrayObjectPair;
- (void)caculateSmallerCounts:(NSMutableArray<NSValue *> *)pairs smallerCounts:(NSMutableArray<NSNumber *> *)countsArray;
- (void)mergeSmallerCounts:(NSMutableArray<NSValue *> *)pairs
                 withArray:(NSMutableArray<NSValue *> *)array1
                  andArray:(NSMutableArray<NSValue *> *)array2
             smallerCounts:(NSMutableArray<NSNumber *> *)countsArray;

//N皇后问题 (51)
- (NSMutableArray<NSArray<NSString *> *> *)solveNQueens:(NSUInteger)n;
- (void)updateMarks:(NSMutableArray <NSMutableArray<NSNumber *> *> *)marks//mark标记当前可以放置的位置, 0是可放置, 1是不开放置
        atPositionX:(NSInteger)x//将queen放在(x,y)后, 更新当前棋盘可放置的queen位置
       andPositionY:(NSInteger)y;
- (void)generateNQueens:(NSUInteger)n //问题规模n queens
   currentPutdownQueens:(NSUInteger)currentRow //当前放置了几个queen
                  marks:(NSMutableArray<NSMutableArray<NSNumber *> *> *)marks //标记棋盘上的位置是否可以放置queen
              locations:(NSMutableArray<NSMutableString *> *)locations //当前棋盘上摆放的queen '.'和'Q'分别表示是否放置了queen
                 result:(NSMutableArray<NSArray<NSString *> *> *)result; //保存结果
    
@end

NS_ASSUME_NONNULL_END
