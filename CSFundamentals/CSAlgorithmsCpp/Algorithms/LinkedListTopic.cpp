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

bool Solution::hasCycle(ListNode *head) {
    std::set<ListNode *> node_set;
    while (head) {
        if (node_set.find(head) != node_set.end()) {
            return true;
        }
        node_set.insert(head);
        head = head->next;
    }
    return false;
}

ListNode* Solution::detectCycle(ListNode *head) {
    ListNode *fast = head, *slow = head;
    ListNode *meet = NULL;
    while (fast) {
        fast = fast->next;
        slow = slow->next;
        if (!fast) {
            return NULL;
        }
        fast = fast->next;
        if (fast == slow) {
            meet = fast;//保存相遇结点并退出循环
            break;
        }
    }
    //没有相遇点
    if (!meet) {
        return NULL;
    }
    while (head && meet) {
        if (head == meet) {
            return head;
        }
        head = head->next;
        meet = meet->next;
    }
    return NULL;
}

ListNode* Solution::partition(ListNode* head, int x) {
    ListNode less_head(0), more_head(0);
    ListNode *less_ptr = &less_head, *more_ptr = &more_head;
    while (head) {
        if (head->val < x) {
            less_ptr->next = head;
            less_ptr = head;
        } else {
            more_ptr->next = head;
            more_ptr = head;
        }
        head = head->next;
    }
    //小于和大于等于的链表相连接 大于等于链表中的最后结点next域置空
    less_ptr->next = more_head.next;
    more_ptr->next = NULL;
    
    return less_head.next;
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

/*
 ListNode a1(1), a2(2), b1(3), b2(4), b3(5);
 ListNode c1(6), c2(7), c3(8);
 a1.next = &a2;
 a2.next = &c1;
 c1.next = &c2;
 c2.next = &c3;
 b1.next = &b2;
 b2.next = &b3;
 b3.next = &c1;
 Solution solve;
 ListNode *result = solve.getIntersectionNode(&a1, &b1);
 printf("%d\n", result->val);
 */

/*
 ListNode a(1), b(2), c(3), d(4), e(5), f(6), g(7);
 a.next = &b;
 b.next = &c;
 c.next = &d;
 d.next = &e;
 e.next = &f;
 f.next = &g;
 g.next = &c;
 
 Solution solve;
 ListNode *result = solve.detectCycle(&a);
 printf("%d\n", result->val);
 */
