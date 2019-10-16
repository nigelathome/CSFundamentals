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

//有环链表的环头结点
- (ListNode *)detectCycle:(ListNode*)head;

@end

NS_ASSUME_NONNULL_END
