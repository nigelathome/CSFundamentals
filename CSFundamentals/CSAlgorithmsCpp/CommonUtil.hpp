//
//  CommonUtil.hpp
//  CSAlgorithmsCpp
//
//  Created by Hui,Li on 2020/11/22.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#ifndef CommonUtil_hpp
#define CommonUtil_hpp

#include <stdio.h>

class CommonUtil {
public:
    //前序遍历trie树
    void preorder_trie(TrieNode *node, int layer);
    
    //输出单链表
    void print_linked_list(ListNode *head);
    
    //链表长度
    int get_list_length(ListNode *head);
    
    //两个链表对齐 返回对齐后的结点
    ListNode *forward_long_list(int long_len, int short_len, ListNode *head);
    
    //输出带随机指针的单链表
    void print_random_linked_list(Node *head);
};

#endif /* CommonUtil_hpp */
