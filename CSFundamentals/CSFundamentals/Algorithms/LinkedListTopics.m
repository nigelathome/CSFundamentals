//
//  LinkedList.m
//  CSFundamentals
//
//  Created by Hui,Li on 2019/10/3.
//  Copyright © 2019 Hui,Li. All rights reserved.
//

#import "LinkedListTopics.h"
#import "ListNode.h"

@implementation LinkedListTopics

- (ListNode *)reverseList:(ListNode*)head {
    ListNode *new_head = nil;
    while(head) {
        ListNode *next = head.next;
        head.next = new_head;
        new_head = head;
        head = next;
    }
    return new_head;
}

@end
