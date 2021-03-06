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
    
    //86. 分隔链表
    ListNode* partition(ListNode* head, int x);
    
    //138. 复制带随机指针的链表
    Node* copyRandomList(Node* head);
    
    //21. 合并两个有序链表
    ListNode* mergeTwoLists(ListNode* l1, ListNode* l2);
    
    //23. 合并K个升序链表
    ListNode* mergeKLists(std::vector<ListNode*>& lists);
    
    //237. 删除链表中的节点
    void deleteNode(ListNode* node);
    
    //面试题 02.02. 返回倒数第 k 个节点
    int kthToLast(ListNode* head, int k);
    
    //NC70 链表排序
    ListNode* sortInList(ListNode* head);
    
    //NC2 重排链表
    void reorderList(ListNode *head);
    
    //剑指 Offer 62. 圆圈中最后剩下的数字
    int lastRemaining(int n, int m);
    
    //NC50 链表中的节点每k个一组翻转
    ListNode* reverseKGroup(ListNode* head, int k);
};

#endif /* LinkedListTopic_hpp */
