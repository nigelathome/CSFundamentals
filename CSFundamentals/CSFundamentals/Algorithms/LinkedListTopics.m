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

#pragma mark solutions

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

- (ListNode *)getIntersectionNode:(ListNode*)headA and:(ListNode*)headB {
    NSInteger lenA = [headA get_list_length];
    NSInteger lenB = [headB get_list_length];
    ListNode *modifed_head = nil, *another_head = nil;
    if (lenA > lenB) {//将长链表的头指针对齐短链表的头指针
        modifed_head = [headA forward_long_list_step:(lenA-lenB)];
        another_head = headB;
    } else {
        modifed_head = [headB forward_long_list_step:(lenB-lenA)];
        another_head = headA;
    }
    
    while (another_head && modifed_head) { //逐个比较找第一个相交节点
        if (another_head == modifed_head)
            return modifed_head;
        else {
            modifed_head = modifed_head.next;
            another_head = another_head.next;
        }
    }
    
    return nil;
}

- (ListNode *)getIntersectionNodeWithSet:(ListNode*)headA and:(ListNode*)headB {
    NSMutableSet *nodeSet = [NSMutableSet new];
    while(headA){
        [nodeSet addObject:headA];
        headA = headA.next;
    }
    
    while(headB){
        if ([nodeSet containsObject:headB]) {
            return headB;
        };
        headB = headB.next;
    }
    
    return nil;
}

- (BOOL)hasCycle:(ListNode*)head {
    if (!head) return NO;
    ListNode *fast = head, *slow = head;
    do {
        fast = fast.next.next;
        slow = slow.next;
    } while (fast && slow && fast!=slow);

    return (slow == fast);
}

#pragma mark test-code
/*
 ListNode *a = [[ListNode alloc] initWithValue:1];
 ListNode *b = [[ListNode alloc] initWithValue:2];
 ListNode *c = [[ListNode alloc] initWithValue:3];
 ListNode *d = [[ListNode alloc] initWithValue:4];
 ListNode *e = [[ListNode alloc] initWithValue:5];
 a.next = b;
 b.next = c;
 c.next = d;
 d.next = e;
 
 ListNode *head = [[ListNode alloc] initListNode:a];
 NSLog(@"Before reverse:\n");
 while(head) {
 NSLog(@"%ld\n", (long)head.val);
 head = head.next;
 }
 
 LinkedListTopics *linkedListTopics = [[LinkedListTopics alloc] init];
 //        head = [linkedListTopics reverseList:a];
 //        head = [linkedListTopics reverseList:a between:1 and:5]; //[1,4], [2,4], [1,5]
 
 
 NSLog(@"After reverse:\n");
 while(head) {
 NSLog(@"%ld\n", (long)head.val);
 head = head.next;
 }
 
 }
 
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
 */

@end
