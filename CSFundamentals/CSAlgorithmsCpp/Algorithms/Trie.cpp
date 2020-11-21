//
//  Trie.cpp
//  CSAlgorithmsCpp
//
//  Created by Hui,Li on 2020/11/21.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#include "Trie.hpp"

void TrieNode::preorder_trie(TrieNode *node, int layer) {
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

void TrieNode::get_all_word_from_trie(TrieNode *node, std::string &word, std::vector<std::string>&word_list) {
    for (int i = 0; i<TRIE_MAX_CHAR_NUM; i++) {
        if (node->child[i]) {
            word.push_back(i + 'a');
            if (node->child[i]->is_end) {
                word_list.push_back(word);
            }
            get_all_word_from_trie(node->child[i],word, word_list);
            word.erase(word.length()-1, 1);//去掉栈顶字符
        }
    }
}

