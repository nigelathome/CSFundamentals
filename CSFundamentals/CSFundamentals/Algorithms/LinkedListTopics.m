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
        fast = fast.next;
        slow = slow.next;
        if (!fast) {
            return NO;
        }
        fast = fast.next;
    } while (fast && slow && fast!=slow);

    return (slow == fast);
}

- (ListNode *)detectCycle:(ListNode*)head {
    ListNode *fast = head, *slow = head, *meet = nil;
    do {
        fast = fast.next;
        slow = slow.next;
        if (!fast){
            return nil; //没有环
        }
        fast = fast.next;
    } while (fast && slow && fast!=slow);
    
    meet = fast;
    if (!meet) {
        return nil;
    }
    
    while(head && meet && meet != head) {
        meet = meet.next;
        head = head.next;
    }
    
    return meet;
}

- (ListNode *)detectCycleWithSet:(ListNode *)head {
    NSMutableSet *nodeSet = [NSMutableSet new];
    while(head){
        if([nodeSet containsObject:head]){
            return head;
        }
        [nodeSet addObject:head];
        head = head.next;
    }
    
    return nil;
}

- (RandomListNode *)copyRandomList:(RandomListNode*)head {
    if (!head) return nil;
    RandomListNode *ptr = head;
    NSMutableArray<RandomListNode*> *nodeArray = [NSMutableArray new];//新节点序号及地址
    NSMapTable<RandomListNode*, RandomListNode*> *nodeMap = [NSMapTable new]; //key-value: 旧节点地址-新节点地址
    while(ptr){
        RandomListNode *copyNode = [RandomListNode new];
        copyNode.val = ptr.val;
        [nodeArray addObject:copyNode];
        [nodeMap setObject:copyNode forKey:ptr];
//        RandomListNode *cur = [nodeMap objectForKey:ptr];
        ptr = (RandomListNode*)ptr.next;
    }
    
    if([nodeArray count] == 0){
        return nil;
    } else {
     [nodeArray addObject:[RandomListNode new]];//添加一个节点,否则nodeArray[index].next = nodeArray[index+1];//连接新链表next指针会数组越界
    }
    
    ptr = head;
    NSInteger index = 0;
    while(ptr){
        nodeArray[index].next = nodeArray[index+1];//连接新链表next指针
        RandomListNode *randomValue = ptr.random;
        if (randomValue){
            RandomListNode *copyRandomValue = [nodeMap objectForKey:randomValue];
            nodeArray[index].random = copyRandomValue;
        }
        index ++;
        ptr = (RandomListNode*)ptr.next;
    }
    
    //处理最后一个节点next
    [nodeArray removeLastObject];
    [nodeArray lastObject].next = nil;
    
    return nodeArray[0];
}

- (ListNode *)mergeTwoLists:(ListNode*)l1 and:(ListNode*)l2 {
    ListNode *preHead = [ListNode new];
    ListNode *head = preHead;
    while(l1 && l2){
        if (l1.val < l2.val){
            head.next = l1;
            l1 = l1.next;
        } else {
            head.next = l2;
            l2 = l2.next;
        }
        head = head.next;
    }
    if (l1){
        head.next = l1;
    } else {
        head.next = l2;
    }
    return preHead.next;
}

- (ListNode *)partition:(ListNode*)head withTarget:(NSUInteger)target {
    if (!head) return nil;
    ListNode *lessHead = [ListNode new], *lessPtr = lessHead;
    ListNode *moreHead = [ListNode new], *morePtr = moreHead;
    while(head){
        if (head.val < target){
            lessPtr.next = head;
            lessPtr = lessPtr.next;
        } else {
            morePtr.next = head;
            morePtr = morePtr.next;
        }
        head = head.next;
    }
    morePtr.next = nil;
    lessPtr.next = moreHead.next;
    return lessHead.next;
}

- (ListNode *)mergeKLists:(NSArray<ListNode *>*)lists {
    if ([lists count] == 0) return nil;
    if ([lists count] == 1) return lists[0];
    if ([lists count] == 2) {
        return [self mergeTwoLists:lists[0] and:lists[1]];
    }
    
    NSUInteger mid = [lists count]/2;
    NSMutableArray<ListNode*> *sub1Lists = [NSMutableArray new];
    NSMutableArray<ListNode*> *sub2Lists = [NSMutableArray new];
    for(NSUInteger i=0; i<mid; i++){
        [sub1Lists addObject:lists[i]];
    }
    for(NSUInteger i=mid; i<[lists count]; i++){
        [sub2Lists addObject:lists[i]];
    }
    ListNode *sub1Node = [self mergeKLists:sub1Lists];
    ListNode *sub2Node = [self mergeKLists:sub2Lists];
    return [self mergeTwoLists:sub1Node and:sub2Node];
}

- (ListNode *)mergeKListsBySort:(NSArray<ListNode *>*)lists {
    if ([lists count] == 0) return nil;
    NSMutableArray<ListNode*> *nodeArray = [NSMutableArray new];
    ListNode *head = nil;
    for(NSUInteger i=0; i<[lists count]; i++){
        head = lists[i];
        while(head){
            [nodeArray addObject:head];
            head = head.next;
        }
    }
    
    [nodeArray sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        ListNode *node1 = (ListNode*)obj1;
        ListNode *node2 = (ListNode*)obj2;
        if (node1.val < node2.val){//从小到大排序
            return NSOrderedAscending;
        } else {
            return NSOrderedDescending;
        }
    }];
    
    for(NSInteger i=1; i<[nodeArray count]; i++){//重新建立指向关系
        nodeArray[i-1].next = nodeArray[i];
    }
    [nodeArray lastObject].next = nil;
    return nodeArray[0];
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
 ListNode *intersection = [linkedListTopics getIntersectionNodeWithSet:a1 and:b1];
 if (intersection) {
 NSLog(@"%d\n", (int)intersection.val);
 } else {
 NSLog(@"No Intersection\n");
 }
 
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
 a7.next = a8;  a8.next = a1;
 
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
 
 // create a linked list that has a cycle
 ListNode *a = [[ListNode alloc] initWithValue:1];
 ListNode *b = [[ListNode alloc] initWithValue:4];
 ListNode *c = [[ListNode alloc] initWithValue:3];
 ListNode *d = [[ListNode alloc] initWithValue:2];
 ListNode *e = [[ListNode alloc] initWithValue:5];
 ListNode *f = [[ListNode alloc] initWithValue:2];
 
 a.next = b; b.next = c; c.next = nil;
 d.next = e; e.next = f; f.next = nil;
 
 ListNode *head = a;
 NSLog(@"list:\n");
 while(head) {
 NSLog(@"val = %ld\n", (long)head.val);
 head = head.next;
 }
 
 ListNode *newHead = [linkedListTopics partition:a withTarget:3];
 NSLog(@"partition list:\n");
 while(newHead) {
 NSLog(@"val = %ld\n", (long)newHead.val);
 newHead = newHead.next;
 }
 */

@end
