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
        ListNode *b = [[ListNode alloc] initWithValue:6];
        ListNode *c = [[ListNode alloc] initWithValue:8];
        ListNode *d = [[ListNode alloc] initWithValue:0];
        ListNode *e = [[ListNode alloc] initWithValue:5];
        ListNode *f = [[ListNode alloc] initWithValue:7];
        ListNode *g = [[ListNode alloc] initWithValue:2];
        ListNode *h = [[ListNode alloc] initWithValue:3];
        ListNode *i = [[ListNode alloc] initWithValue:4];
        ListNode *j = [[ListNode alloc] initWithValue:9];
        ListNode *k = [[ListNode alloc] initWithValue:10];
        
        a.next = b; b.next = c; c.next = nil;
        d.next = e; e.next = f; f.next = nil;
        g.next = h; h.next = nil;
        i.next = j; j.next = k; k.next = nil;

        NSMutableArray<ListNode*> *lists = [NSMutableArray new];
        [lists addObject:a];
        [lists addObject:d];
        [lists addObject:g];
        [lists addObject:i];
        NSLog(@"list:\n");
        ListNode *head = [linkedListTopics mergeKLists:lists];
        while(head) {
            NSLog(@"val = %ld\n", (long)head.val);
            head = head.next;
        }
    }
    return 0;
}
