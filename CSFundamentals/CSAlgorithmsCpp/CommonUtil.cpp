//
//  CommonUtil.cpp
//  CSAlgorithmsCpp
//
//  Created by Hui,Li on 2020/11/22.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#include "CommonUtil.hpp"

void CommonUtil::preorder_trie(TrieNode* node, int layer) {
    for (int i=0; i<TRIE_MAX_CHAR_NUM; i++) {
        if (node->child[i]) {
            for (int j=0; j<layer; j++) {
                printf("---");
            }
            printf("%c", i+'a');
            if (node->child[i]->is_end) {
                printf("<end>");
            }
            printf("\n");
            preorder_trie(node->child[i], layer+1);
        }
    }
}

void CommonUtil::print_linked_list(ListNode* head) {
    ListNode *first = head;
    while (head) {
        if (head == first) {
            printf("%d", head->val);
        } else {
            printf("->%d", head->val);
        }
        head = head->next;
    }
    printf("\n");
}

int CommonUtil::get_list_length(ListNode *head) {
    int len = 0;
    while (head) {
        head = head->next;
        len++;
    }
    return len;
}

ListNode* CommonUtil::forward_long_list(int long_len, int short_len, ListNode *head) {
    int delta = long_len - short_len;
    while (head && delta) {//delta=0时恰好gead指向对齐后的第一个结点
        head = head->next;
        delta--;
    }
    return head;
}

void CommonUtil::print_random_linked_list(Node *head) {
    while (head) {
        if (head->random) {
            printf("val = %d ran = %d\n", head->val, head->random->val);
        } else {
            printf("val = %d ran = NULL\n", head->val);
        }
        head = head->next;
    }
}

void CommonUtil::preorder_binary_tree(TreeNode *node, int layer) {
    if (!node) {
        return;
    }
    for (int i=0; i<layer; i++) {
        printf("---");
    }
    printf("[%d]\n", node->val);
    preorder_binary_tree(node->left, layer+1);
    preorder_binary_tree(node->right, layer+1);
}

void CommonUtil::inorder_binary_tree(TreeNode *node, int layer) {
    if (!node) {
        return;
    }
    inorder_binary_tree(node->left, layer+1);
    for (int i=0; i<layer; i++) {
        printf("---");
    }
    printf("[%d]\n", node->val);
    inorder_binary_tree(node->right, layer+1);
}

void CommonUtil::postorder_binary_tree(TreeNode *node, int layer) {
    if (!node) {
        return;
    }
    postorder_binary_tree(node->left, layer+1);
    postorder_binary_tree(node->right, layer+1);
    for (int i=0; i<layer; i++) {
        printf("---");
    }
    printf("[%d]\n", node->val);
}
