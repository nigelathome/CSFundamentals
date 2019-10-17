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
        RandomListNode *a = [[RandomListNode alloc] initWithValue:1];
        RandomListNode *b = [[RandomListNode alloc] initWithValue:2];
        RandomListNode *c = [[RandomListNode alloc] initWithValue:3];
        RandomListNode *d = [[RandomListNode alloc] initWithValue:4];
        RandomListNode *e = [[RandomListNode alloc] initWithValue:5];
        
        a.next = b; b.next = c; c.next = d; d.next = e;
        a.random = nil; b.random = d; c.random = b; d.random = a; e.random = e;

        RandomListNode *head = a;
        RandomListNode *copyHead = [linkedListTopics copyRandomList:head];
        NSLog(@"original link list:\n");
        while(head) {
            if(head.random){
                NSLog(@"val = %ld random = %ld\n", (long)head.val, (long)head.random.val);
            } else {
                NSLog(@"val = %ld random = nil\n", (long)copyHead.val);
            }
            head = (RandomListNode*)head.next;
        }
        NSLog(@"copied link list:\n");
        while(copyHead) {
            if(copyHead.random){
                NSLog(@"val = %ld random = %ld\n", (long)copyHead.val, (long)copyHead.random.val);
            } else {
                NSLog(@"val = %ld random = nil\n", (long)copyHead.val);
            }
            copyHead = (RandomListNode*)copyHead.next;
        }
    }
    return 0;
}
