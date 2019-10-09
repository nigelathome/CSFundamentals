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
        head.next = new_head; //逆转当前节点的指针
        new_head = head;
        head = next;
    }
    return new_head;
}

- (ListNode *)reverseList:(ListNode*)head between:(NSInteger)m and:(NSInteger)n {
    NSInteger change_len = n-m+1;
    ListNode *pre_m = nil, *result = head;
    
    while(--m && head) { //找到第m个节点的前驱
        pre_m = head;
        head = head.next;
    }
    
    ListNode *tail = head;//此时head指向第m个节点, tail指向反转之后的第n个节点
    
    ListNode *new_head = nil;
    while(head && change_len) { //对[m,n]这m-n+1个节点依次进行逆转
        ListNode *next = head.next;
        head.next = new_head;
        new_head = head;
        head = next;//循环结束之后，head会指向原先第n个节点的下一个节点
        change_len--;
    }
    
    pre_m.next = new_head;
    tail.next = head;

    if(!pre_m) { //m是第一个节点
        return new_head;
    }
    
    return result;
}

@end
