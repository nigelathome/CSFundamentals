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
