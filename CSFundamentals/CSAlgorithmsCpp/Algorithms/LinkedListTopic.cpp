//
//  LinkedListTopic.cpp
//  CSAlgorithmsCpp
//
//  Created by Hui,Li on 2020/11/22.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#include "LinkedListTopic.hpp"

ListNode* Solution::reverseList(ListNode* head) {
    if (!head) {
        return NULL;
    }
    ListNode *new_head = NULL;
    ListNode *ptr = NULL;
    while (head) {
        ptr = head->next;
        head->next = new_head;
        new_head = head;
        head = ptr;
    }
    return new_head;
}

ListNode* Solution::reverseBetween(ListNode* head, int m, int n) {
    if (!head) {
        return NULL;
    }
    ListNode *result = head;//保存反转前链表的头结点
    ListNode *pre_head = NULL;
    int change_len = n - m + 1;
    
    //找到第m-1个结点
    while (head && --m) {
        pre_head = head;
        head = head->next;
    }
    
    ListNode *tail = head;//记录反转后最后的结点
    //反转第m-第n个结点
    ListNode *new_head = NULL;
    ListNode *ptr = NULL;
    while (head && change_len) {
        ptr = head->next;
        head->next = new_head;
        new_head = head;
        head = ptr;
        change_len--;
    }
    //反转后最后一个节点与第n结点后继相连
    tail->next = head;
    if (pre_head) {
        pre_head->next = new_head;
    } else {
        result = new_head;//处理m=1的情况 此时pre_head是NULL
    }
    return result;
}

//ListNode* Solution::getIntersectionNode(ListNode *headA, ListNode *headB) {
//    std::set<ListNode *> node_set;
//    while (headA) {//将A的结点存入set中
//        node_set.insert(headA);
//        headA = headA->next;
//    }
//    while (headB) {
//        //依次遍历B的结点, 在set中存在的结点就是A-B相交的第一个结点
//        if (node_set.find(headB) != node_set.end()) {
//            return headB;
//        }
//        headB = headB->next;
//    }
//
//    return headB;
//}
ListNode* Solution::getIntersectionNode(ListNode *headA, ListNode *headB) {
    CommonUtil commonUtil;
    ListNode *ptrA = headA, *ptrB = headB;
    int a_len = commonUtil.get_list_length(ptrA);
    int b_len = commonUtil.get_list_length(ptrB);
    if (a_len > b_len) {
        headA = commonUtil.forward_long_list(a_len, b_len, headA);
    } else {
        headB = commonUtil.forward_long_list(b_len, a_len, headB);
    }
    while (headA && headB) {
        if (headA == headB) {
            return headA;
        }
        headA = headA->next;
        headB = headB->next;
    }
    
    return NULL;
}

#pragma mark code-test
/*
 ListNode a(10), b(20), c(30), d(40), e(50);
 a.next = &b;
 b.next = &c;
 c.next = &d;
 d.next = &e;
 e.next = NULL;
 ListNode *head = &a;
 CommonUtil *commonUtil = new CommonUtil();
 commonUtil->print_linked_list(head);
 
 Solution *s = new Solution();
 ListNode *new_head = s->reverseList(head);
 commonUtil->print_linked_list(new_head);
 */

/*
 ListNode a(10), b(20), c(30), d(40), e(50);
 a.next = &b;
 b.next = &c;
 c.next = &d;
 d.next = &e;
 e.next = NULL;
 ListNode *head = &a;
 CommonUtil *commonUtil = new CommonUtil();
 commonUtil->print_linked_list(head);
 
 Solution *s = new Solution();
 ListNode *new_head = s->reverseBetween(head, 2, 4);
 commonUtil->print_linked_list(new_head);
 */
