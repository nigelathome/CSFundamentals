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

Node* Solution::copyRandomList(Node* head) {
    std::map<Node *, int> node_set; //将结点和序号映射成map
    std::vector<Node *> node_vec; //依次保存复制的结点
    Node *head_ptr = head;
    int i = 0;
    while (head_ptr) {
        Node *node = new Node(head_ptr->val);
        node_vec.push_back(node);
        node_set[head_ptr] = i;
        i++;
        head_ptr = head_ptr->next;
    }
    node_vec.push_back(0);//做尾结点 即NULL
    i = 0;
    while (head) {
        node_vec[i]->next = node_vec[i+1]; //复制next指向关系
        if (head->random) {
            int id = node_set[head->random];
            node_vec[i]->random = node_vec[id]; //复制random指向关系
        }
        i++;
        head = head->next;
    }
    return node_vec[0];
    
    return NULL;
}

ListNode* Solution::mergeTwoLists(ListNode* l1, ListNode* l2) {
    ListNode tmp_head(0);
    ListNode *ptr = &tmp_head;
    while (l1 && l2) {
        if (l1->val <= l2->val) {
            ptr->next = l1;
            l1 = l1->next;
        } else {
            ptr->next = l2;
            l2 = l2->next;
        }
        ptr = ptr->next;
    }
    if (l1) {
        ptr->next = l1;
    }
    if (l2) {
        ptr->next = l2;
    }
    return tmp_head.next;
}

//bool cmp(const ListNode *a, const ListNode *b) {
//    return a->val <= b->val;
//}
//
//ListNode* Solution::mergeKLists(std::vector<ListNode*>& lists) {
//    if (lists.size() == 0) {
//        return NULL;
//    }
//    std::vector<ListNode *> node_vec;
//    ListNode *head = NULL;
//    for (int i = 0; i<lists.size(); i++) {
//        head = lists[i];
//        while (head) {//保存每条单链表的每个结点
//            node_vec.push_back(head);
//            head = head->next;
//        }
//    }
//    //对每个结点从小到大排序
//    std::sort(node_vec.begin(), node_vec.end(), cmp);
//    node_vec.push_back(0);
//    //设置指向关系
//    for (int i=0; i<node_vec.size()-1; i++) {
//        node_vec[i]->next = node_vec[i+1];
//    }
//    return node_vec[0];
//}

ListNode* Solution::mergeKLists(std::vector<ListNode*>& lists) {
    if (lists.size() == 0) {
        return NULL;
    }
    if (lists.size() == 1) {
        return lists[0];
    }
    if (lists.size() == 2) {
        return mergeTwoLists(lists[0], lists[1]);
    }
    int mid = (int)lists.size()/2;
    std::vector<ListNode *> sub_lists1, sub_lists2;
    //将链表两两分组放入字列表中
    for (int i=0; i<mid; i++) {
        sub_lists1.push_back(lists[i]);
    }
    for (int i=mid; i<lists.size(); i++) {
        sub_lists2.push_back(lists[i]);
    }
    ListNode *l1 = mergeKLists(sub_lists1);
    ListNode *l2 = mergeKLists(sub_lists2);
    return mergeTwoLists(l1, l2);
}

void Solution::deleteNode(ListNode* node) {
    ListNode *next_node = node->next;
    node->val = next_node->val;
    node->next = next_node->next;
    delete next_node;
}

int Solution::kthToLast(ListNode* head, int k) {
    if (!head || k==0) {
        return NULL;
    }
    ListNode *ptr = head;
    //ptr执行第k+1个结点 距离head k个结点
    while (k--) {
        if (!ptr) {
            return NULL;
        } else {
            ptr = ptr->next;
        }
    }
    //ptr与head同时向前遍历 当ptr指向最后一个结点的下一个结点时 head恰好指向倒数k个结点
    while (ptr) {
        head = head->next;
        ptr = ptr->next;
    }
    return head->val;
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

/*
 ListNode a(1), b(4), c(3), d(2), e(5), f(2);
 a.next = &b;
 b.next = &c;
 c.next = &d;
 d.next = &e;
 e.next = &f;
 
 CommonUtil commonUtil;
 commonUtil.print_linked_list(&a);
 
 Solution solve;
 ListNode *result = solve.partition(&a, 3);
 commonUtil.print_linked_list(result);
 */

/*
 std::map<Node *, int> node_map;
 Node a(1), b(2), c(3), d(4), e(5);
 a.next = &b;
 b.next = &c;
 c.next = &d;
 d.next = &e;
 a.random = &c;
 b.random = &d;
 c.random = &c;
 e.random = &d;
 
 Solution solve;
 Node *head = solve.copyRandomList(&a);
 CommonUtil *commonUtil = new CommonUtil();
 commonUtil->print_random_linked_list(head);
 */

/*
 ListNode l1(1), b(4), c(6), l2(0), e(5), f(7);
 l1.next = &b;
 b.next = &c;
 
 l2.next = &e;
 e.next = &f;
 
 Solution solve;
 CommonUtil *commonUtil = new CommonUtil();
 commonUtil->print_linked_list(&l1);
 commonUtil->print_linked_list(&l2);
 
 ListNode *head = solve.mergeTwoLists(&l1, &l2);
 commonUtil->print_linked_list(head);
 */

/*
 ListNode a(1), b(4), c(6), d(0), e(5), f(7), g(2), h(3);
 a.next = &b;
 b.next = &c;
 d.next = &e;
 e.next = &f;
 g.next = &h;
 
 std::vector<ListNode *> lists;
 lists.push_back(&a);
 lists.push_back(&d);
 lists.push_back(&g);
 CommonUtil commonUtil;
 commonUtil.print_linked_list(&a);
 commonUtil.print_linked_list(&d);
 commonUtil.print_linked_list(&g);
 
 Solution solve;
 ListNode *head = solve.mergeKLists(lists);
 commonUtil.print_linked_list(head);
 */

/*
 ListNode *a = new ListNode(4);
     ListNode *b = new ListNode(5);
     ListNode *c = new ListNode(1);
     ListNode *d = new ListNode(9);
     a->next = b;
     b->next = c;
     c->next = d;
     
     CommonUtil commonUtil;
     commonUtil.print_linked_list(a);
     
     Solution solve;
     solve.deleteNode(b);
     commonUtil.print_linked_list(a);
     ListNode *head = solve.mergeKLists(lists);
     commonUtil.print_linked_list(head);
 */

/*
 ListNode a(1), b(2), c(3), d(4), e(5);
 a.next = &b;
 b.next = &c;
 c.next = &d;
 d.next = &e;
 CommonUtil commonUtil;
 commonUtil.print_linked_list(&a);
 int k = 2;
 Solution solve;
 int value = solve.kthToLast(&a, k);
 printf("%d\n", value);
 */
