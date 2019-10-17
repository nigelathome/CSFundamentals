//
//  LinkedList.h
//  CSFundamentals
//
//  Created by Hui,Li on 2019/10/3.
//  Copyright © 2019 Hui,Li. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class ListNode;
@class RandomListNode;

@interface LinkedListTopics : NSObject

//反转链表
- (ListNode *)reverseList:(ListNode*)head;

//反转链表[m,n]个节点的部分
- (ListNode *)reverseList:(ListNode*)head between:(NSInteger)m and:(NSInteger)n;

//求两个链表是否相交，求交点
- (ListNode *)getIntersectionNode:(ListNode*)headA and:(ListNode*)headB;

//求两个链表是否相交，求交点 NSSet方法
- (ListNode *)getIntersectionNodeWithSet:(ListNode*)headA and:(ListNode*)headB;

//链表是否有环
- (BOOL)hasCycle:(ListNode*)head;

//求有环链表的环头结点
- (ListNode *)detectCycle:(ListNode*)head;

//求有环链表的环头结点 NSSet方法
- (ListNode *)detectCycleWithSet:(ListNode*)head;

//复制复杂链表
- (RandomListNode *)copyRandomList:(RandomListNode*)head;

//合并两个有序链表
- (ListNode *)mergeTwoLists:(ListNode*)l1 and:(ListNode*)l2;

//合并K个有序链表
- (ListNode *)mergeKLists:(NSArray<ListNode *>*)lists;

//合并K个有序链表 排序法
- (ListNode *)mergeKListsWithSort:(NSArray<ListNode *>*)lists;

//划分链表
- (ListNode *)partition:(ListNode*)head withTarget:(NSUInteger)target;

@end

NS_ASSUME_NONNULL_END
