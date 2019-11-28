//
//  main.m
//  CSFundamentals
//
//  Created by Hui,Li on 2019/10/2.
//  Copyright © 2019 Hui,Li. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LinkedListTopics.h"
#import "DPTopics.h"
#import "StackQueueHeapTopics.h"
#import "StringTopics.h"
#import "ListNode.h"
#import "Stack.h"
#import "Queue.h"
#import "GreedyTopics.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, US!");
        NSLog(@"Hello, CHINA!");
        
        StackQueueHeapTopics *stackQueueHeadTopics = [StackQueueHeapTopics new];
        LinkedListTopics *linkedListTopics = [LinkedListTopics new];
        DPTopics *dPTopics = [DPTopics new];
        StringTopics *stringTopics = [StringTopics new];
        GreedyTopics *greedyTopics = [GreedyTopics new];
        
//        GasStation a = {4, 4}, b = {5, 2}, c = {11, 5}, d = {15, 10};
//        NSUInteger distance = 25, gasVolume = 10;
        GasStation a = {4, 4}, b = {10, 3}, c = {11, 5}, d = {15, 2};
        NSUInteger distance = 25, gasVolume = 16;
        NSValue *A = [NSValue valueWithBytes:&a objCType:@encode(GasStation)];
        NSValue *B = [NSValue valueWithBytes:&b objCType:@encode(GasStation)];
        NSValue *C = [NSValue valueWithBytes:&c objCType:@encode(GasStation)];
        NSValue *D = [NSValue valueWithBytes:&d objCType:@encode(GasStation)];
        
        GasStation destinationPoint = {0, 0}; //需要将终点作为一个加油站, 距离终点是0, 可加油量是0
        NSValue *E = [NSValue valueWithBytes:&destinationPoint objCType:@encode(GasStation)];

        NSArray *gasStations = @[A, B, C, D, E];
        NSInteger cnt = [greedyTopics getMinimumStopCntToDestination:distance withGasolineVolume:gasVolume gasStations:gasStations];
        NSLog(@"最少需要加油次数: %ld", cnt);
    }
    return 0;
}
