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
        
        NSArray<NSNumber*> *nums1 = @[@3, @2, @0, @4];
        BOOL isCanJump = [greedyTopics canJump:nums1];
        NSLog(@"%@", isCanJump ? @"YES" : @"NO");
        
        NSArray<NSNumber*> *nums2 = @[@2, @3, @1, @4];
        BOOL isCanJump2 = [greedyTopics canJump:nums2];
        NSLog(@"%@", isCanJump2 ? @"YES" : @"NO");
        
        NSArray<NSNumber*> *nums3 = @[@2, @3, @1, @1, @4];
        BOOL isCanJump3 = [greedyTopics canJump:nums2];
        NSLog(@"%@", isCanJump3 ? @"YES" : @"NO");
    }
    return 0;
}
