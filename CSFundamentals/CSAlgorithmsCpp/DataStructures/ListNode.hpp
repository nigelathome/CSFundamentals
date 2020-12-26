//
//  ListNode.hpp
//  CSAlgorithmsCpp
//
//  Created by Hui,Li on 2020/11/22.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#ifndef ListNode_hpp
#define ListNode_hpp

#include <stdio.h>

/*
 单链表结点
 */
struct ListNode {
    int val;
    ListNode *next;
    ListNode(int x);
};

/*
 双链表结点
 */
struct DListNode {
    int val;
    DListNode *llink;
    DListNode *rlink;
    DListNode(int x);
};

#endif /* ListNode_hpp */
