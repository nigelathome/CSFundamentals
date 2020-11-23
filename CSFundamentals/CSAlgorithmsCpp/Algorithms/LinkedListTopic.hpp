//
//  LinkedListTopic.hpp
//  CSAlgorithmsCpp
//
//  Created by Hui,Li on 2020/11/22.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#ifndef LinkedListTopic_hpp
#define LinkedListTopic_hpp

#include <stdio.h>

class Solution {
public:
    //206. 反转链表
    ListNode* reverseList(ListNode* head);
    
    //92. 反转链表 II
    ListNode* reverseBetween(ListNode* head, int m, int n);
    
    //160. 相交链表
    ListNode *getIntersectionNode(ListNode *headA, ListNode *headB);
    
    //141. 环形链表是否有环
    bool hasCycle(ListNode *head);
    
    //142. 环形链表 II
    ListNode *detectCycle(ListNode *head);

};

#endif /* LinkedListTopic_hpp */
