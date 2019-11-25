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
        
        NSMutableString *result1 = [greedyTopics removeKdigitsFrom:@"1432219" withK:3];
        NSLog((NSString*)@"%@", result1);
        
        NSMutableString *result2 = [greedyTopics removeKdigitsFrom:@"100200" withK:1];
        NSLog((NSString*)@"%@", result2);
    }
    return 0;
}
