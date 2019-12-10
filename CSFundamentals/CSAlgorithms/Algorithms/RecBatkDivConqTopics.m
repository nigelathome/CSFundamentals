//
//  RecBatkDivConqTopics.m
//  CSAlgorithms
//
//  Created by Hui,Li on 2019/11/28.
//  Copyright © 2019 Hui,Li. All rights reserved.
//

#import "RecBatkDivConqTopics.h"

@implementation RecBatkDivConqTopics

- (NSMutableArray *)subsets:(NSArray<NSNumber *> *)nums {
    NSMutableArray *items = [[NSMutableArray alloc] init]; //记录每个子集
    NSMutableArray<NSArray<NSNumber *> *> *result = [[NSMutableArray alloc] init] ; //记录结果
    [result addObject:items]; //将空集放入result中
    [self generateSubsets:0 numArray:nums items:items result:result];
    return result;
}

- (void)generateSubsets:(NSUInteger)index
               numArray:(NSArray<NSNumber *> *)nums
                  items:(NSMutableArray *)items
                 result:(NSMutableArray<NSArray<NSNumber *> *> *)result {
    if (index == [nums count]) {
        return;
    }
    [items addObject:nums[index]];
    NSArray<NSNumber *> *currentItems = [NSArray arrayWithArray:items];
    [result addObject:currentItems];
    [self generateSubsets:index + 1 numArray:nums items:items result:result]; //加入该元素的递归调用
    [items removeLastObject];
    [self generateSubsets:index + 1 numArray:nums items:items result:result]; //不加入该元素的递归调用
}

- (void)generate:(NSUInteger)index
        numArray:(NSArray<NSNumber *> *)nums
           items:(NSMutableArray *)items
          result:(NSMutableArray<NSArray<NSNumber*> *> *)result {
    if (index == [nums count]) {
        return;
    }
    [items addObject:nums[index]];
    NSArray<NSNumber*> *currentItems = [NSArray arrayWithArray:items];
    [result addObject:currentItems];
    [self generate:index + 1 numArray:nums items:items result:result];
}

- (NSMutableArray *)subsetsWithDup:(NSArray<NSNumber *> *)nums {
    if (0 == [nums count]) { //返回空集
        return [[NSMutableArray alloc] init];
    }
    //对nums排序以避免出现[2 1 2 2]子集是[1 2 2] [2 1 2]重复的情况
    NSArray<NSNumber *> *sortedNums = [nums sortedArrayUsingComparator:^NSComparisonResult(NSNumber * _Nonnull obj1, NSNumber * _Nonnull obj2) {
        if ([obj1 integerValue] < [obj2 integerValue]) {
            return NSOrderedAscending;
        } else {
            return NSOrderedDescending;
        }
    }];
    
    NSMutableArray<NSArray<NSNumber *> *> *result = [[NSMutableArray alloc] init] ; //记录结果
    NSMutableArray *items = [[NSMutableArray alloc] init]; //记录每个可能的子集
    [result addObject:items]; //加入空集
    NSMutableSet *set = [[NSMutableSet alloc] init]; //用了判断是否是重复的子集 例如[1 2 2]和[1 2 2]u取自不同的2,但是同一个子集
    [self generateSubsetsWithDup:0 numArray:sortedNums items:items set:set result:result];
    return result;
}

- (void)generateSubsetsWithDup:(NSUInteger)index
                      numArray:(NSArray<NSNumber *> *)nums
                         items:(NSMutableArray *)items
                           set:(NSMutableSet *)set
                        result:(NSMutableArray<NSArray<NSNumber *> *> *)result {
    if (index == [nums count]) {
        return;
    }
    [items addObject:nums[index]];
    NSArray *currentItems = [NSArray arrayWithArray:items];
    
    if (![set containsObject:currentItems]) {//判断是否是重复的子集, 不重复才添加
        [set addObject:currentItems];
        [result addObject:currentItems];
    }
    
    [self generateSubsetsWithDup:index + 1 numArray:nums items:items set:set result:result];
    
    [items removeLastObject]; //弹出nums[index]后再进行递归
    [self generateSubsetsWithDup:index + 1 numArray:nums items:items set:set result:result];
}

- (NSMutableArray<NSArray<NSNumber *> *> *)combinationSum2:(NSArray<NSNumber *> *)candidates target:(NSInteger)target {
    if ([candidates count] == 0 || ([candidates count] == 1 && [candidates[0] integerValue] != target)) {
        return nil;
    }
    NSMutableArray<NSArray<NSNumber *> *> *result = [[NSMutableArray alloc] init];
    NSMutableArray<NSNumber *> *items = [[NSMutableArray alloc] init];
    NSMutableSet *set = [[NSMutableSet alloc] init];
    NSArray<NSNumber *> *sortedCandidated = [candidates sortedArrayUsingComparator:^NSComparisonResult(NSNumber * _Nonnull obj1, NSNumber * _Nonnull obj2) {
        if ([obj1 integerValue] < [obj2 integerValue]) {
            return NSOrderedAscending;
        }
        return NSOrderedDescending;
    }];
    NSInteger sum = 0;
    [self generateSubsets:0 candidates:sortedCandidated items:items set:set sum:sum target:target result:result];
    return result;
}

- (void)generateSubsets:(NSUInteger)index
             candidates:(NSArray<NSNumber *> *)candidates
                  items:(NSMutableArray *)items
                    set:(NSMutableSet *)set
                    sum:(NSInteger)sum
                 target:(NSInteger)target
                 result:(NSMutableArray<NSArray<NSNumber *> *> *)result {
    if (index == [candidates count]) {
        return;
    }
    if (sum > target) {//剪枝
        return;
    }
    [items addObject:candidates[index]];
    NSArray *currentItem = [NSArray arrayWithArray:items];
    sum += [candidates[index] integerValue] ;
    if (sum == target && ![set containsObject:currentItem]) {
        [set addObject:currentItem];
        [result addObject:currentItem]; //元素的和是target且是不重复的子集即是满足条件的子集
    }
    [self generateSubsets:index + 1 candidates:candidates items:items set:set sum:sum target:target result:result];
    
    sum -= [candidates[index] integerValue];
    [items removeLastObject];
    [self generateSubsets:index + 1 candidates:candidates items:items set:set sum:sum target:target result:result];
}

- (NSMutableArray<NSString *> *)generateAllPossibleParenthesis:(NSUInteger)n {
    if (n == 0) {
        return nil;
    }
    NSMutableArray<NSString *> *result = [[NSMutableArray alloc] init];
    NSMutableString *parenthesis = [[NSMutableString alloc] init];
    [self generateAllPossibleParenthesis:n items:parenthesis result:result];
    return result;
}

- (void)generateAllPossibleParenthesis:(NSUInteger)n items:(NSMutableString *)items result:(NSMutableArray<NSString *> *)result {
    if ([items length] == 2 * n) { //n组括号那么字符串长度是2n
        [result addObject:items];
        return;
    }
    
    //必须重新开辟新的字符串, 不能使用items, 否则会相互影响
    NSMutableString *nextItems1 = [NSMutableString stringWithString:items];
    [nextItems1 appendString:@"("]; //加入'('的递归
    [self generateAllPossibleParenthesis:n items: nextItems1 result:result];
    
    NSMutableString *nextItems2 = [NSMutableString stringWithString:items];
    [nextItems2 appendString:@")"]; //加入'）'的递归
    [self generateAllPossibleParenthesis:n items: nextItems2 result:result];
}

- (NSMutableArray<NSString *> *)generateParenthesis:(NSUInteger)n {
    if (n == 0) {
        return nil;
    }
    NSMutableArray<NSString *> *result = [[NSMutableArray alloc] init];
    NSMutableString *items = [[NSMutableString alloc] init];
    [self generateParenthesis:n leftCnt:0 rightCnt:0 items:items result:result];
    return result;
}

- (void)generateParenthesis:(NSUInteger)n              //'()'括号的对数
                    leftCnt:(NSUInteger)leftCnt        //'('的个数
                   rightCnt:(NSUInteger)rightCnt       //')'的个数
                      items:(NSMutableString *)items   //'('和')'的组合
                     result:(NSMutableArray<NSString *> *)result {
    if (rightCnt == n && rightCnt == n) { //合法的括号必须是'('和')'个数相同都是n
        [result addObject:items];
        return;
    }
    
    if (leftCnt < n) { //'('不超过n个
        //必须重新开辟新的字符串, 不能使用items, 否则会相互影响
        NSMutableString *nextItems1 = [NSMutableString stringWithString:items];
        [nextItems1 appendString:@"("]; //加入'('的递归
        [self generateParenthesis:n leftCnt:leftCnt + 1 rightCnt:rightCnt items:nextItems1 result:result];
    }

    if (leftCnt > rightCnt ) { //只有'('个数大于')'时才能继续放置')';
        NSMutableString *nextItems2 = [NSMutableString stringWithString:items];
        [nextItems2 appendString:@")"]; //加入'）'的递归
        [self generateParenthesis:n leftCnt:leftCnt rightCnt:rightCnt + 1 items:nextItems2 result:result];
    }
}

- (void)mergeTwoSortedArray:(NSArray<NSNumber *> *)arr1 andArray:(NSArray<NSNumber *> *)arr2 sortedArray:(NSMutableArray<NSNumber *> *)sortedArray {
    NSUInteger i = 0, j = 0;
    while (i < [arr1 count] && j < [arr2 count]) {
        if ([arr1[i] integerValue] <= [arr2[j] integerValue]) {
            [sortedArray addObject:arr1[i++]];
        } else {
            [sortedArray addObject:arr2[j++]];
        }
    }
    for (; i < [arr1 count]; i++) {
        [sortedArray addObject:arr1[i]];
    }
    for (; j < [arr2 count]; j++) {
        [sortedArray addObject:arr2[j]];
    }
}

- (void)mergeSort:(NSMutableArray<NSNumber *> *)nums {
    if ([nums count] < 2) {
        return;
    }
    NSMutableArray *arr1 = [[NSMutableArray alloc] init];
    NSMutableArray *arr2 = [[NSMutableArray alloc] init];
    NSUInteger i = 0, j = 0, mid = [nums count] / 2;
    
    //原问题分解成子问题
    for (i = 0; i < mid; i++) {
        [arr1 addObject:nums[i]];
    }
    for (j = mid; j < [nums count]; j++) {
        [arr2 addObject:nums[j]];
    }
    
    //子问题分别处理
    [self mergeSort:arr1];
    [self mergeSort:arr2];
    [nums removeAllObjects]; //必须要清空nums在进行合并,否则会增加新元素
    
    //合并子问题并处理
    [self mergeTwoSortedArray:arr1 andArray:arr2 sortedArray:nums];
}

- (NSMutableArray<NSNumber *> *)countSmaller:(NSArray<NSNumber *> *)nums {
    if ([nums count] < 1) {
        return nil;
    }
    NSMutableArray<NSValue *> *pairsArray = [[NSMutableArray alloc] init];
    NSMutableArray<NSNumber *> *smallerCounts = [[NSMutableArray alloc] init];
    [nums enumerateObjectsUsingBlock:^(NSNumber * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        ArrayObjectPair objectPair = {[obj integerValue], idx};
        NSValue *value = [NSValue valueWithBytes:&objectPair objCType:@encode(ArrayObjectPair)];
        [pairsArray addObject:value]; //nums转换成(value, index)这样的数组, 对value分治的处理
        [smallerCounts addObject:[NSNumber numberWithInteger:0]]; //初始化smallCounts
    }];
    [self caculateSmallerCounts:pairsArray smallerCounts:smallerCounts];
    return smallerCounts;
}

- (void)caculateSmallerCounts:(NSMutableArray<NSValue *> *)pairs smallerCounts:(NSMutableArray<NSNumber *> *)countsArray {
    if ([pairs count] < 2) {
        return;
    }
    // divide
    NSMutableArray<NSValue *> *arr1 = [[NSMutableArray alloc] init];
    NSMutableArray<NSValue *> *arr2 = [[NSMutableArray alloc] init];
    NSUInteger i = 0, j = 0, mid = [pairs count] / 2;
    for (; i < mid; i++) {
        [arr1 addObject:pairs[i]];
    }
    for (j = mid; j < [pairs count]; j++) {
        [arr2 addObject:pairs[j]];
    }
    [self caculateSmallerCounts:arr1 smallerCounts:countsArray];
    [self caculateSmallerCounts:arr2 smallerCounts:countsArray];
    [pairs removeAllObjects];
    // conquer
    [self mergeSmallerCounts:pairs withArray:arr1 andArray:arr2 smallerCounts:countsArray];
}

- (void)mergeSmallerCounts:(NSMutableArray<NSValue *> *)pairs
                 withArray:(NSMutableArray<NSValue *> *)array1
                  andArray:(NSMutableArray<NSValue *> *)array2
             smallerCounts:(NSMutableArray<NSNumber *> *)countsArray { //countsArray记录比该元素小的元素个数
    NSUInteger i = 0, j = 0;
    ArrayObjectPair p1, p2;
    while (i < [array1 count] && j < [array2 count]) {
        [array1[i] getValue:&p1];
        [array2[j] getValue:&p2];
        if (p1.value <= p2.value) { //p1的值比p2小（包括等于)就将p2插入数组中,并且更新c对应的count为j的值
            NSInteger updatedCounts = [countsArray[p1.index] integerValue] + j;
            countsArray[p1.index] = [NSNumber numberWithInteger:updatedCounts];
            [pairs addObject:array1[i++]];
        } else {
            [pairs addObject:array2[j++]];
        }
    }
    for (; i < [array1 count]; i++) {
        [array1[i] getValue:&p1];
        NSInteger newCounts = [countsArray[p1.index] integerValue] + j;
        countsArray[p1.index] = [NSNumber numberWithInteger:newCounts];
        [pairs addObject:array1[i]];
    }
    for (; j < [array2 count]; j++) {
        [pairs addObject:array2[j]];
    }
}

- (NSMutableArray<NSArray<NSString *> *> *)solveNQueens:(NSUInteger)n {
    NSMutableArray<NSArray<NSString *> *> *result = [[NSMutableArray alloc] init];
    NSMutableArray<NSMutableArray<NSNumber *> *> *marks = [[NSMutableArray alloc] init];//Q可以摆放的区域
    NSMutableArray<NSMutableString *> *locations = [[NSMutableArray alloc] init];//Q摆放的情况
    for (NSUInteger i = 0; i < n; i++) {//初始化marks和locations
        NSMutableArray<NSNumber *> *row = [[NSMutableArray alloc] init];
        NSMutableString *position = [[NSMutableString alloc] init];
        for (NSUInteger j = 0; j < n; j++) {
            [row addObject:[NSNumber numberWithInteger:0]];
            [position appendString:@"."];
        }
        [marks addObject:row];
        [locations addObject:position];
    }
    [self generateNQueens:n currentPutdownQueens:0 marks:marks locations:locations result:result];
    return result;
}

- (void)generateNQueens:(NSUInteger)n
   currentPutdownQueens:(NSUInteger)currentRow
                  marks:(NSMutableArray<NSMutableArray<NSNumber *> *> *)marks
              locations:(NSMutableArray<NSMutableString *> *)locations  
                 result:(NSMutableArray<NSArray<NSString *> *> *)result {
    if (currentRow == n) {
        NSMutableArray *valLocations = [[NSMutableArray alloc] init];
        for (NSMutableArray *row in locations) {
            NSArray *tempRow = [row mutableCopy]; //必须重新开辟空间
            [valLocations addObject:tempRow];
        }
        [result addObject:valLocations];
        return;
    }
    for (NSUInteger currentCol = 0; currentCol < n; currentCol++) { //按列来寻找放置queen的位置
        if ([marks[currentRow][currentCol] integerValue] == 0) { //该位置可以放置queen
            [locations[currentRow] replaceCharactersInRange:NSMakeRange(currentCol, 1) withString:@"Q"]; //放置queen在(currentRow, currentCol)
            
            //保存当前marks, 用于进行回溯操作下一列的尝试
            NSMutableArray *currentMarks = [[NSMutableArray alloc] init];
            for (NSMutableArray *row in marks) {
                NSMutableArray *tempRow = [row mutableCopy];
                [currentMarks addObject:tempRow];
            }
            
            [self updateMarks:marks atPositionX:currentRow andPositionY:currentCol]; //更新可放置queen的标记
            [self generateNQueens:n currentPutdownQueens:currentRow + 1 marks:marks locations:locations result:result];
            
            //回溯
            [locations[currentRow] replaceCharactersInRange:NSMakeRange(currentCol, 1) withString:@"."]; //将该位置重置
            marks = currentMarks; //回溯到递归前的棋盘
        }
    }
}

- (void)updateMarks:(NSMutableArray <NSMutableArray<NSNumber *> *> *)marks atPositionX:(NSInteger)x andPositionY:(NSInteger)y {
    if ([marks[x][y] integerValue] == 1) { //该位置已经放了queen,不再处理
        return;
    }
    marks[x][y] = [NSNumber numberWithInteger:1]; //更新(x,y)位置为1
    //方向数组, 表示棋盘上某个位置四周8个方向, 依次是左、左上、正上、右上、右、右下、正下、左下
    NSArray<NSNumber *> *dx = @[@(-1), @(-1), @0, @1, @1, @1, @0, @(-1)];
    NSArray<NSNumber *> *dy = @[@0, @1, @1, @1, @0, @(-1), @(-1), @(-1)];
    for (NSUInteger i = 1; i < [marks count]; i++) { //同一方向上的可能n个格子进行操作, 包括同一行、列、斜线
        for (NSUInteger j = 0; j < 8; j++) { //八个方向
            NSInteger newX = x + [dx[j] integerValue] * i;
            NSInteger newY = y + [dy[j] integerValue] * i;
            if (newX >= 0 && newX < [marks count]  && newY >= 0 && newY < [marks count]) { //棋盘区域是x:0-n,y:0-n
                marks[newX][newY] = [NSNumber numberWithInteger:1];
            }
        }
    }
}


#pragma mark test-code
/*
 //求无重复的一组数的全部子集 (78)
 NSArray<NSNumber *> *nums = [NSArray arrayWithObjects:@1, @2, @3, nil];
 NSMutableArray *items = [[NSMutableArray alloc] init];
 NSMutableArray *result = [recBatkDivConqTopics subsets:nums];
 
 [result enumerateObjectsUsingBlock:^(NSArray *  _Nonnull items, NSUInteger idx, BOOL * _Nonnull stop) {
 if (0 == [items count]) {
 printf("[]\n");
 }
 [items enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
 printf("[%ld]", (long)[obj integerValue]);
 if ([items count] - 1 == idx) {
 printf("\n");
 }
 }];
 }];
 */

/*
 //求有重复的一组数的全部子集 (90)
 NSArray<NSNumber *> *nums = [NSArray arrayWithObjects:@2, @1, @2, @2, nil];
 NSMutableArray<NSArray<NSNumber *> *> *result = [recBatkDivConqTopics subsetsWithDup:nums];
 [result enumerateObjectsUsingBlock:^(NSArray * _Nonnull items, NSUInteger idx, BOOL * _Nonnull stop) {
 if (0 == [items count]) {
 printf("[]\n");
 }
 [items enumerateObjectsUsingBlock:^(NSNumber * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
 printf("[%ld]", [obj integerValue]);
 if ([items count] - 1 == idx) {
 printf("\n");
 }
 }];
 }];
 */

/*
 //元素和等于target的不重复子集 (40)
 NSArray<NSNumber *> *candidates = [NSArray arrayWithObjects:@10, @1, @2, @7, @6, @1, @5, nil];
 NSInteger target = 8;
 NSMutableArray<NSArray<NSNumber *> *> *result = [recBatkDivConqTopics combinationSum2:candidates target:target];
 [result enumerateObjectsUsingBlock:^(NSArray * _Nonnull items, NSUInteger idx, BOOL * _Nonnull stop) {
 if (0 == [items count]) {
 printf("[]\n");
 }
 [items enumerateObjectsUsingBlock:^(NSNumber * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
 printf("[%ld]", [obj integerValue]);
 if ([items count] - 1 == idx) {
 printf("\n");
 }
 }];
 }];
 */

/*
 //生成n组可能的括号 (22)
 NSMutableArray<NSString *> *result = [recBatkDivConqTopics generateAllPossibleParenthesis:2];
 [result enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
 for (NSUInteger i = 0; i < [obj length]; i++) {
 unichar ch = [obj characterAtIndex:i];
 printf("%c", ch);
 }
 printf("\n");
 }];
 //        NSMutableString *items = [[NSMutableString alloc] init];
 //        [items appendString:@"((("];
 //        NSRange last = NSMakeRange([items length] - 1, 1); //将字符串最后一个字符换成')'
 //        [items deleteCharactersInRange:last];
 //        [items appendString:@")"];
 //        NSLog(@"%@", (NSString *)items);
 */

/*
 //生成n组合法的括号
 NSMutableArray<NSString *> *result = [recBatkDivConqTopics generateParenthesis:3];
 [result enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
 for (NSUInteger i = 0; i < [obj length]; i++) {
 unichar ch = [obj characterAtIndex:i];
 printf("%c", ch);
 }
 printf("\n");
 }];
 */

/*
 //归并两个有序数组 -从小到大有序
 NSArray *arr1 = [NSArray arrayWithObjects:@2, @5, @8, @20, nil];
 NSArray *arr2 = [NSArray arrayWithObjects:@1, @3, @5, @7, @30, @50, nil];
 NSMutableArray<NSNumber *> *sortedArray = [[NSMutableArray alloc] init];
 [recBatkDivConqTopics mergeTwoSortedArray:arr1 andArray:arr2 sortedArray:sortedArray];
 [sortedArray enumerateObjectsUsingBlock:^(NSNumber * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
 printf("[%ld]", (long)[obj integerValue]);
 if ([sortedArray count] - 1 == idx) {
 printf("\n");
 }
 }];
 */

/*
 //归并排序
 NSArray *arr1 = [NSArray arrayWithObjects:@5, @(-7), @ 9, @8, @1, @4, @(-3), @10, @2, @0, nil];
 NSMutableArray<NSNumber *> *nums = [[NSMutableArray alloc] init];
 [arr1 enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
 [nums addObject:obj];
 }];
 [recBatkDivConqTopics mergeSort:nums];
 [nums enumerateObjectsUsingBlock:^(NSNumber * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
 printf("[%ld]", (long)[obj integerValue]);
 if ([nums count] - 1 == idx) {
 printf("\n");
 }
 }];
 */

/*
 //求逆序数 (315)
 NSArray *nums = [NSArray arrayWithObjects:@5, @(-7), @9, @1, @3, @5, @(-2), @1, nil];
 NSMutableArray<NSNumber *> *counts = [recBatkDivConqTopics countSmaller:nums];
 [counts enumerateObjectsUsingBlock:^(NSNumber * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
 printf("[%ld]", (long)[obj integerValue]);
 if ([counts count] - 1 == idx) {
 printf("\n");
 }
 }];
 */

/*
 //N皇后问题 (51)
 printf("N queens solutions:============================\n");
 NSMutableArray<NSArray<NSString *> *> *result = [recBatkDivConqTopics solveNQueens:8];
 [result enumerateObjectsUsingBlock:^(NSArray<NSString *> * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
 printf("第%ld情况: \n", (long)idx);
 for (NSString *row in obj) {
 printf("[ ");
 for (NSInteger i = 0; i < [row length]; i++) {
 printf("%c ", [row characterAtIndex:i]);
 }
 printf("]\n");
 }
 printf("\n");
 }];
 */

@end
