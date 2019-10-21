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

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, US!");
        NSLog(@"Hello, CHINA!");
        
        StackQueueHeapTopics *stackQueueHeadTopics = [StackQueueHeapTopics new];
        LinkedListTopics *linkedListTopics = [LinkedListTopics new];
        DPTopics *dPTopics = [DPTopics new];
        StringTopics *stringTopics = [StringTopics new];
        MinStack *minStack = [MinStack new];
        [minStack push:[NSNumber numberWithInteger:-2]];
        NSLog(@"top = [%d]\n", (int)[[minStack top] integerValue]);
        NSLog(@"min = [%d]\n\n", (int)[[minStack getMin] integerValue]);
        [minStack push:[NSNumber numberWithInteger:0]];
        NSLog(@"top = [%d]\n", (int)[[minStack top] integerValue]);
        NSLog(@"min = [%d]\n\n", (int)[[minStack getMin] integerValue]);
        [minStack push:[NSNumber numberWithInteger:-5]];
        NSLog(@"top = [%d]\n", (int)[[minStack top] integerValue]);
        NSLog(@"min = [%d]\n\n", (int)[[minStack getMin] integerValue]);
        [minStack pop];
        NSLog(@"top = [%d]\n", (int)[[minStack top] integerValue]);
        NSLog(@"min = [%d]\n\n", (int)[[minStack getMin] integerValue]);
    }
    return 0;
}
