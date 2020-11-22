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
};

#endif /* CommonUtil_hpp */
