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
        
        Ballon b1 = {10, 16}, b2 = {2, 8}, b3 = {1, 6}, b4 = {7, 12};
        NSValue *pValue1 = [NSValue valueWithBytes:&b1 objCType:@encode(Ballon)];
        NSValue *pValu2 = [NSValue valueWithBytes:&b2 objCType:@encode(Ballon)];
        NSValue *pValu3 = [NSValue valueWithBytes:&b3 objCType:@encode(Ballon)];
        NSValue *pValu4 = [NSValue valueWithBytes:&b4 objCType:@encode(Ballon)];
        NSArray *points = @[pValue1, pValu2, pValu3, pValu4];
//        [arr[0] getValue:&b2];
//        NSLog(@"%ld, %ld", b2.first, b2.second);
        NSUInteger num = [greedyTopics findMidArrowShots:points];
        NSLog(@"最少需要: %ld", num);
    }
    return 0;
}
