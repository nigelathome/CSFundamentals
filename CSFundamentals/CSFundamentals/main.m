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

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, US!");
        NSLog(@"Hello, CHINA!");
        
        StackQueueHeapTopics *stackQueueHeadTopics = [StackQueueHeapTopics new];
        LinkedListTopics *linkedListTopics = [LinkedListTopics new];
        DPTopics *dPTopics = [DPTopics new];
        StringTopics *stringTopics = [StringTopics new];
        
        MedianFinder *medianFinder = [[MedianFinder alloc] init];
        NSArray<NSNumber*> *nums = [NSArray arrayWithObjects:@(6), @(10), @(1), @(7), @(99), @(4), @(3), nil];
        [nums enumerateObjectsUsingBlock:^(NSNumber * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [medianFinder addNum:[obj integerValue]];
            NSLog(@"%lf", [medianFinder findMedian]);
        }];

    }
    return 0;
}
