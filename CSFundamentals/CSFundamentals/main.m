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
    }
    return 0;
}
