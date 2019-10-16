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
#import "StackQueueTopics.h"
#import "StringTopics.h"
#import "ListNode.h"
#import "Stack.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, US!");
        NSLog(@"Hello, CHINA!");
        
        StackQueueTopics *stackQueueTopics = [StackQueueTopics new];
        LinkedListTopics *linkedListTopics = [LinkedListTopics new];
        DPTopics *dPTopics = [DPTopics new];
        StringTopics *stringTopics = [StringTopics new];
        
        // create a linked list that has a cycle
        ListNode *a1 = [[ListNode alloc] initWithValue:1];
        ListNode *a2 = [[ListNode alloc] initWithValue:2];
        ListNode *a3 = [[ListNode alloc] initWithValue:3];
        ListNode *a4 = [[ListNode alloc] initWithValue:4];
        ListNode *a5 = [[ListNode alloc] initWithValue:5];
        ListNode *a6 = [[ListNode alloc] initWithValue:6];
        ListNode *a7 = [[ListNode alloc] initWithValue:7];
        ListNode *a8 = [[ListNode alloc] initWithValue:8];
        a1.next = a2;  a2.next = a3;
        a3.next = a4;  a4.next = a5;
        a5.next = a6;  a6.next = a7;
        a7.next = a8;  a8.next = a3;
        
        ListNode *head = a1;
        BOOL hasCycle = [linkedListTopics hasCycle:head];
        if (hasCycle) {
            NSLog(@"has cycle!\n");
        } else {
            NSLog(@"has no cycle!\n");
        }
    }
    return 0;
}
