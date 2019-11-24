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
//        NSArray<NSNumber*> *nums = @[@1, @17, @5, @10, @13, @15, @10, @5, @16, @8];
//        NSArray<NSNumber*> *nums = @[@1, @7, @4, @9, @2, @5];
//        NSArray<NSNumber*> *nums = @[@1, @4, @7, @2, @5];
        NSArray<NSNumber*> *nums = @[@1, @7, @4, @5, @5];
        NSUInteger maxLength = [greedyTopics wiggleMaxLength:nums];
        NSLog(@"%ld", maxLength);
        
    }
    return 0;
}
