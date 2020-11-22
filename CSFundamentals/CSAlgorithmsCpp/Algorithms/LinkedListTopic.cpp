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
