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
#import "RecBatkDivConqTopics.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, US!");
        NSLog(@"Hello, CHINA!");
        
        StackQueueHeapTopics *stackQueueHeadTopics = [[StackQueueHeapTopics alloc] init];
        LinkedListTopics *linkedListTopics = [[LinkedListTopics alloc] init];
        DPTopics *dPTopics = [[DPTopics alloc] init];
        StringTopics *stringTopics = [[StringTopics alloc] init];
        GreedyTopics *greedyTopics = [[GreedyTopics alloc] init];
        RecBatkDivConqTopics *recBatkDivConqTopics = [[RecBatkDivConqTopics alloc] init];
        
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
    }
    return 0;
}
