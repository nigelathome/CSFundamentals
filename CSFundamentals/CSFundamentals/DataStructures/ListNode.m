//
//  ListNode.m
//  CSFundamentals
//
//  Created by Hui,Li on 2019/10/2.
//  Copyright © 2019 Hui,Li. All rights reserved.
//

#import "ListNode.h"

@implementation ListNode

- (instancetype)initWithValue:(NSInteger)val {
    if (self = [super init]) {
        self.val = val;
        self.next = nil;
    }
    return self;
}

- (instancetype)initListNode:(ListNode *)node {
    if (self = [super init]) {
        self.val = node.val;
        self.next = node.next;
    }
    return self;
}

//求链表长度
- (NSUInteger)get_list_length {
    NSUInteger len = 0;
    ListNode *head = self;
    while(head) {
        head = head.next;
        len++;
    }
    return len;
}

//链表头指针向前移动n步
- (ListNode *)forward_long_list_step:(NSInteger)step {
    ListNode *modified_head = self;
    while(step && modified_head) {
        modified_head = modified_head.next;
        step--;
    }
    return modified_head;
}

@end
