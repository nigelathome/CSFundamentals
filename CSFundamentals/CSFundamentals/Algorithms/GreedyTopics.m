//
//  GreedyTopics.m
//  CSFundamentals
//
//  Created by Hui,Li on 2019/10/30.
//  Copyright © 2019 Hui,Li. All rights reserved.
//

#import "GreedyTopics.h"
#import "Stack.h"
#import "Queue.h"

@implementation GreedyTopics

- (NSUInteger)findCotentChildren:(NSArray<NSNumber*>*)g withCookies:(NSArray<NSNumber*>*)s {
    //g元素代表能满足的糖果大小,s是每个糖果的大小
    //g/s依次有小到大排序
    NSArray *contentsArray = [g sortedArrayUsingComparator:^NSComparisonResult(NSNumber*  _Nonnull obj1, NSNumber*  _Nonnull obj2) {
        NSNumber *num1 = (NSNumber*)obj1;
        NSNumber *num2 = (NSNumber*)obj2;
        if ([num1 integerValue] < [num2 integerValue]) {
            return NSOrderedAscending;
        } else {
            return NSOrderedDescending;
        }
    }];
    NSArray *candySizeArray = [s sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        NSNumber *num1 = (NSNumber*)obj1;
        NSNumber *num2 = (NSNumber*)obj2;
        if ([num1 integerValue] < [num2 integerValue]) {
            return NSOrderedAscending;
        } else {
            return NSOrderedDescending;
        }
    }];
    
    NSUInteger children = 0, candyIndex = 0;
    while (children < [contentsArray count] && candyIndex < [candySizeArray count]) {
        if ([contentsArray[children] integerValue] <= [candySizeArray[candyIndex] integerValue]){
            children++;
        }
        candyIndex++;
    }
    return children;
}

- (NSUInteger)wiggleMaxLength:(NSArray<NSNumber*>*)nums {
    if ([nums count] < 2) {
        return [nums count];
    }
    
    STATE state = BEGIN;
    NSUInteger maxLength = 1;
    
    for (NSInteger i = 1; i < [nums count]; i++) {
        switch (state) {
            case BEGIN:
                if ([nums[i] integerValue] > [nums[i-1] integerValue]) {
                    state = UP;
                    maxLength++;
                } else if ([nums[i] integerValue] < [nums[i-1] integerValue]) {
                    state = DOWN;
                    maxLength++;
                }
                break;
            case UP:
                if ([nums[i] integerValue] < [nums[i-1] integerValue]) {
                    state = DOWN;
                    maxLength++;
                }
                break;
            case DOWN:
                if ([nums[i] integerValue] > [nums[i-1] integerValue]) {
                    state = UP;
                    maxLength++;
                }
                break;
            default:
                break;
        }
    }
    return maxLength;
}

- (NSMutableString *)removeKdigitsFrom:(NSString*)nums withK:(NSUInteger)k {
    Stack *stack = [Stack new];
    NSMutableString *result = [NSMutableString new];
    
    for (NSUInteger i = 0; i < nums.length; i++) {
        unichar digit = [nums characterAtIndex:i];
        NSUInteger num = digit - '0';//ASCII数字->int
        
        while (![stack empty] && k) {//k不等于0并且栈不空的时候，依次删除比当前数字大数字，即高位的数字
            NSUInteger stackTopNum = [(NSString *)[stack top] characterAtIndex:0] - '0';
            if (stackTopNum > num) {
                [stack pop];
                k--;
            } else {
                break;
            }
        }
        
        if (![stack empty] || num != 0) {//加入元素, 栈空则不加入0元素
            [stack push:[NSString stringWithFormat:@"%c", digit]];
        }
    }
    
    while (![stack empty] && k) {//k还不为0，即还有删除的机会，则把低位的k个数字删除
        [stack pop];
        k--;
    }
    
    [stack enumerateObjectsFromBottom:^(id obj) {
        [result appendString:(NSString*)obj];
    }];
        
    return result;
}

- (BOOL)canJump:(NSArray<NSNumber *> *)nums {
    if (nums.count < 2) {
        return YES;
    }
    
    NSMutableArray<NSNumber*> *indexArray = [NSMutableArray new];//记录每个位置能跳跃到的最远位置
    for (NSUInteger i = 0; i < nums.count; i++) {
        [indexArray addObject:@([nums[i] integerValue] + i)];
    }
    NSUInteger maxIndex = [indexArray[0] integerValue];
    NSUInteger jump = 0;
    while (jump < maxIndex && jump < indexArray.count) {
        if (maxIndex < [indexArray[jump] integerValue]) {
            maxIndex = [indexArray[jump] integerValue];
        }
        jump++;
    }
    return maxIndex >= indexArray.count;
}

- (NSUInteger)jump:(NSArray<NSNumber*>*)nums {
    if (nums.count < 2) {
        return 1;
    }

    NSUInteger minJumpCount = 1; //最少跳跃1次
    NSUInteger maxIndex = [nums[0] integerValue]; //进行1次跳跃能达到的最远下标
    NSUInteger currentMaxIndex = [nums[0] integerValue]; //在跳到nums[i]+i之前最大的跳跃下标
    
    for (NSUInteger i = 1; i < nums.count; i++) { //依次遍历每个下标, 不能达到该下标时才进行一次跳跃, 否则不进行跳跃, 以保证跳跃次数最少
        if (i > maxIndex) { //不能抵达i则进行一次跳跃, 最远距离跟新为currentMaxIndex
            minJumpCount++;
            maxIndex = currentMaxIndex;
        }
        
        if (currentMaxIndex < [nums[i] integerValue] + i) { //更新最大能跳跃的下标
            currentMaxIndex = [nums[i] integerValue] + i;
        }
    }

    return minJumpCount;
}

//jumpPath记录跳跃的路径
- (NSUInteger)jump:(NSArray<NSNumber*>*)nums jumpPath:(NSMutableArray<NSNumber *> *)jumpPath {
    if (nums.count < 2) {
        [jumpPath addObject:@0];
        [jumpPath addObject:@1];
        return 1;
    }
    
    [jumpPath addObject:@0];
    NSUInteger minJumpCount = 1; //最少跳跃1次
    NSUInteger maxIndex = [nums[0] integerValue]; //进行1次跳跃能达到的最远下标
    NSUInteger currentMaxIndex = [nums[0] integerValue]; //在跳到nums[i]+i之前最大的跳跃下标
    NSUInteger currentIndex = 0; //能达到更远距离的下标
    for (NSUInteger i = 1; i < nums.count; i++) { //依次遍历每个下标, 不能达到该下标时才进行一次跳跃, 否则不进行跳跃, 以保证跳跃次数最少
        if (i > maxIndex) { //不能抵达i则进行一次跳跃, 最远距离跟新为currentMaxIndex
            minJumpCount++;
            [jumpPath addObject:[NSNumber numberWithUnsignedInteger:currentIndex]];
            maxIndex = currentMaxIndex;
        }
        
        if (currentMaxIndex < [nums[i] integerValue] + i) { //更新最大能跳跃的下标
            currentMaxIndex = [nums[i] integerValue] + i;
            currentIndex = i;
        }
    }
    [jumpPath addObject:[NSNumber numberWithUnsignedInteger:nums.count - 1]];
    return minJumpCount;
}

- (NSUInteger)findMidArrowShots:(NSArray<NSValue *> *)points {
    if ([points count] < 2) {
        return 1;
    }
    
    NSUInteger minArcherCount = 1;
    [points sortedArrayUsingComparator:^NSComparisonResult(NSValue  * _Nonnull obj1, NSValue * _Nonnull obj2) {//对气球进行由小到大排序
        Ballon v1, v2;
        [obj1 getValue:&v1];
        [obj2 getValue:&v2];
        return v1.first < v2.first;
    }];
    
    Ballon commonInterval; //定义射击范围区间并初始化
    [points[0] getValue:&commonInterval];
    
    for (NSUInteger i = 1; i < [points count]; i++) {
        Ballon currentBallon;
        [points[i] getValue:&currentBallon];
        //有重合则更新公共射击区间
        if (commonInterval.second >= currentBallon.first) {
            commonInterval.first = currentBallon.first;
            if (commonInterval.second > currentBallon.second) {
                commonInterval.second = currentBallon.second;
            }
        } else {
            minArcherCount++;
            [points[i] getValue:&commonInterval];
        }
    }
    return minArcherCount;
}

- (NSInteger)getMinimumStopCntToDestination:(NSUInteger)distance
                         withGasolineVolume:(NSUInteger)gasolineVolume
                                gasStations:(NSArray<NSValue *> *)gasStations {
    NSUInteger minStop = 0;
    [gasStations enumerateObjectsUsingBlock:^(NSValue * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        GasStation g;
        [obj getValue:&g];
        if (idx != [gasStations count]-1) {
            printf("%lu->", (unsigned long)g.distance);
        } else {
            printf("%lu\n", (unsigned long)g.distance);
        }
    }];
    NSMutableArray<NSValue *> *stopPoints = (NSMutableArray *)[gasStations sortedArrayUsingComparator:^NSComparisonResult(NSValue * _Nonnull obj1, NSValue *  _Nonnull obj2) {
        GasStation g1, g2;
        [obj1 getValue:&g1];
        [obj2 getValue:&g2];
        if (g1.distance > g2.distance) {
            return NSOrderedAscending;
        }
        return NSOrderedDescending;
    }]; //对加油站离起点的距离由小到大排序
    
    [stopPoints enumerateObjectsUsingBlock:^(NSValue * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        GasStation g;
        [obj getValue:&g];
        if (idx != [stopPoints count]-1) {
            printf("%lu->", (unsigned long)g.distance);
        } else {
            printf("%lu\n", (unsigned long)g.distance);
        }
    }];
    GasStation currentGasStation;
    NSUInteger remainGasolineVolume = gasolineVolume; //剩余的油量
    PriorityQueue *stationQueue = [[PriorityQueue alloc] init]; //保存经过的加油站油量
    stationQueue.isSmallHeap = NO; //堆顶元素是油量最大的加油站的油量
    for (NSUInteger i = 0; i < [stopPoints count]; i++) {
        [stopPoints[i] getValue:&currentGasStation];
        NSUInteger needGasolineVolume = distance - currentGasStation.distance; //抵达这个加油站需要的油量
        while (![stationQueue empty] && remainGasolineVolume < needGasolineVolume) { //油量不足以到达就加油
            minStop++;
            remainGasolineVolume += [(NSNumber *)[stationQueue front] integerValue];
            [stationQueue pop];
        }
        
        if (remainGasolineVolume < needGasolineVolume) { //加完所能加的油之后还不能达到i那么也不可能到终点
            return -1;
        }
        
        [stationQueue push:[NSNumber numberWithUnsignedInteger:currentGasStation.volume]];
        remainGasolineVolume -= needGasolineVolume ; //达到加油站以后更新剩余的油量
        distance = currentGasStation.distance; //到达i之后离终点的距离
    }
    
    return minStop;
}

#pragma mark test-code
/*
 445分糖果
 GreedyTopics *greedyTopics = [GreedyTopics new];
 NSArray *g = @[@5, @10, @2, @9, @15, @9];
 NSArray *s = @[@6, @1, @20, @3, @8];
 NSUInteger count = [greedyTopics findCotentChildren:g withCookies:s];
 NSLog(@"%ld", count);
 */

/*
 376摇摆子序列
 //        NSArray<NSNumber*> *nums = @[@1, @17, @5, @10, @13, @15, @10, @5, @16, @8];
 //        NSArray<NSNumber*> *nums = @[@1, @7, @4, @9, @2, @5];
 //        NSArray<NSNumber*> *nums = @[@1, @4, @7, @2, @5];
 NSArray<NSNumber*> *nums = @[@1, @7, @4, @5, @5];
 NSUInteger maxLength = [greedyTopics wiggleMaxLength:nums];
 NSLog(@"%ld", maxLength);
 */

/*
 402异常k个数字
 NSMutableString *result1 = [greedyTopics removeKdigitsFrom:@"1432219" withK:3];
 NSLog((NSString*)@"%@", result1);
 
 NSMutableString *result2 = [greedyTopics removeKdigitsFrom:@"100200" withK:1];
 NSLog((NSString*)@"%@", result2);
 
 NSMutableString *result3 = [greedyTopics removeKdigitsFrom:@"12345" withK:3];
 NSLog((NSString*)@"%@", result3);
 */

/*
 //能否跳跃到最后一个元素的位置 (55)
 NSArray<NSNumber*> *nums1 = @[@3, @2, @0, @4];
 BOOL isCanJump = [greedyTopics canJump:nums1];
 NSLog(@"%@", isCanJump ? @"YES" : @"NO");
 
 NSArray<NSNumber*> *nums2 = @[@2, @3, @1, @4];
 BOOL isCanJump2 = [greedyTopics canJump:nums2];
 NSLog(@"%@", isCanJump2 ? @"YES" : @"NO");
 
 NSArray<NSNumber*> *nums3 = @[@2, @3, @1, @1, @4];
 BOOL isCanJump3 = [greedyTopics canJump:nums2];
 NSLog(@"%@", isCanJump3 ? @"YES" : @"NO");
 */

/*
 //跳跃到终点需要的最少步数 (45)
 NSArray<NSNumber*> *nums1 = @[@2, @3, @1, @1, @4];
 NSUInteger count = [greedyTopics jump:nums1];
 NSLog(@"最少跳跃次数: %ld", count);
 */

/*
 //射击全部气球需要的弓箭手数目 (452)
 //        Ballon b1 = {10, 16}, b2 = {2, 8}, b3 = {1, 6}, b4 = {7, 12};
 Ballon b1 = {1, 4}, b2 = {2, 5}, b3 = {3, 7}, b4 = {6, 10}, b5 = {7, 8}, b6 = {9, 11};
 NSValue *pValue1 = [NSValue valueWithBytes:&b1 objCType:@encode(Ballon)];
 NSValue *pValue2 = [NSValue valueWithBytes:&b2 objCType:@encode(Ballon)];
 NSValue *pValue3 = [NSValue valueWithBytes:&b3 objCType:@encode(Ballon)];
 NSValue *pValue4 = [NSValue valueWithBytes:&b4 objCType:@encode(Ballon)];
 NSValue *pValue5 = [NSValue valueWithBytes:&b5 objCType:@encode(Ballon)];
 NSValue *pValue6 = [NSValue valueWithBytes:&b6 objCType:@encode(Ballon)];
 NSArray *points = @[pValue1, pValue2, pValue3, pValue4, pValue5, pValue6];
 //        [arr[0] getValue:&b2];
 //        NSLog(@"%ld, %ld", b2.first, b2.second);
 NSUInteger num = [greedyTopics findMidArrowShots:points];
 NSLog(@"最少需要: %ld", num);
 */
 

@end
