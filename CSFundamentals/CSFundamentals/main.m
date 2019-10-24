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
        
        PriorityQueue *priorityQueue = [PriorityQueue new];
        [priorityQueue push:[NSNumber numberWithInteger:4]];
        NSLog(@"top = [%d]\n", (int)[[priorityQueue front] integerValue]);
        [priorityQueue printObjects];
        NSLog(@"=======================================================");
        
        [priorityQueue push:[NSNumber numberWithInteger:3]];
        NSLog(@"top = [%d]\n", (int)[[priorityQueue front] integerValue]);
        [priorityQueue printObjects];
        NSLog(@"=======================================================");
        
        [priorityQueue push:[NSNumber numberWithInteger:2]];
        NSLog(@"top = [%d]\n", (int)[[priorityQueue front] integerValue]);
        [priorityQueue printObjects];
        NSLog(@"=======================================================");
        
        [priorityQueue push:[NSNumber numberWithInteger:1]];
        NSLog(@"top = [%d]\n", (int)[[priorityQueue front] integerValue]);
        [priorityQueue printObjects];
        NSLog(@"=======================================================");
        
        [priorityQueue pop];
        NSLog(@"top = [%d]\n", (int)[[priorityQueue front] integerValue]);
        [priorityQueue printObjects];
        NSLog(@"=======================================================");
        
        [priorityQueue push:[NSNumber numberWithInteger:0]];
        NSLog(@"top = [%d]\n", (int)[[priorityQueue front] integerValue]);
        [priorityQueue printObjects];
        NSLog(@"=======================================================");
        
        [priorityQueue pop];
        NSLog(@"top = [%d]\n", (int)[[priorityQueue front] integerValue]);
        [priorityQueue printObjects];
        NSLog(@"=======================================================");
        
        [priorityQueue pop];
        NSLog(@"top = [%d]\n", (int)[[priorityQueue front] integerValue]);
        [priorityQueue printObjects];
        NSLog(@"=======================================================");
    }
    return 0;
}
