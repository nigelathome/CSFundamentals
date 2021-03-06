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
    
    //前序遍历二叉树
    void preorder_binary_tree(TreeNode *node, int layer);
    
    //后序遍历二叉树
    void postorder_binary_tree(TreeNode *node, int layer);
        
    //中序遍历二叉树
    void inorder_binary_tree(TreeNode *node, int layer);
    
    //定义二叉树向量
    void print_tree_vec(std::vector<TreeNode *> vec);
    
    //层次遍历二叉树
    void print_tree_in_level(TreeNode *node, int layer);
};

#endif /* CommonUtil_hpp */
