//
//  main.m
//  CSFundamentals
//
//  Created by Hui,Li on 2019/10/2.
//  Copyright © 2019 Hui,Li. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LinkedListTopics.h"
#import "ListNode.h"
#import "DPTopics.h"
#import "StackQueueTopics.h"
#import "StringTopics.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        //     a1->a2->
        //             c1->c2->c3
        // b1->b2->b3->
        ListNode *a1 = [[ListNode alloc] initWithValue:1];
        ListNode *a2 = [[ListNode alloc] initWithValue:2];
        
        ListNode *b1 = [[ListNode alloc] initWithValue:3];
        ListNode *b2 = [[ListNode alloc] initWithValue:4];
        ListNode *b3 = [[ListNode alloc] initWithValue:5];
        
        ListNode *c1 = [[ListNode alloc] initWithValue:6];
        ListNode *c2 = [[ListNode alloc] initWithValue:7];
        ListNode *c3 = [[ListNode alloc] initWithValue:8];
        a1.next = a2;  a2.next = c1;
        c1.next = c2;  c2.next = c3;
        b1.next = b2;  b2.next = b3;
//        b3.next = c1;
        
        LinkedListTopics *linkedListTopics = [[LinkedListTopics alloc] init];
        ListNode *intersection = [linkedListTopics getIntersectionNode:a1 and:b1];
        if (intersection) {
            NSLog(@"%d\n", (int)intersection.val);
        } else {
            NSLog(@"No Intersection\n");
        }
        
        StackQueueTopics *stackQueueTopics = [StackQueueTopics new];
//        NSString *parenthesese = @"{}[]()";
//        NSString *parenthesese = @"{{{}]]";
        NSString *parenthesese = @"]";
        BOOL valid = [stackQueueTopics isValidParentheses:parenthesese];
        NSLog(@"isValid=%@",valid?@"YES":@"NO");
    }
    return 0;
}
