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
        ListNode *a = [[ListNode alloc] initWithValue:1];
        ListNode *b = [[ListNode alloc] initWithValue:4];
        ListNode *c = [[ListNode alloc] initWithValue:6];
        ListNode *d = [[ListNode alloc] initWithValue:0];
        ListNode *e = [[ListNode alloc] initWithValue:5];
        ListNode *f = [[ListNode alloc] initWithValue:7];
        
        a.next = b; b.next = c; c.next = nil;
        d.next = e; e.next = f; f.next = nil;

        ListNode *head = a;
        NSLog(@"l1 list:\n");
        while(head) {
            NSLog(@"val = %ld\n", (long)head.val);
            head = head.next;
        }
        head = d;
        NSLog(@"l2 list:\n");
        while(head) {
            NSLog(@"val = %ld\n", (long)head.val);
            head = head.next;
        }
        head = [linkedListTopics mergeTwoLists:a and:d];
        NSLog(@"merge list:\n");
        while(head) {
            NSLog(@"val = %ld\n", (long)head.val);
            head = head.next;
        }
    }
    return 0;
}
