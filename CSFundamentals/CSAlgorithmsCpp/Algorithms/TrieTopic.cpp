//
//  TrieTopic.cpp
//  CSAlgorithmsCpp
//
//  Created by Hui,Li on 2020/11/21.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#include "TrieTopic.hpp"

WordDictionary::WordDictionary() {
    _trie_tree = new TrieNode();
}

void WordDictionary::addWord(std::string word) {
    TrieNode *ptr = this->_trie_tree;
    for (auto it = word.begin(); it != word.end(); it++) {
        int pos = *it - 'a';
        if (!ptr->child[pos]) {
            TrieNode *newNode = new TrieNode();
            ptr->child[pos] = newNode;
        }
        ptr = ptr->child[pos];
    }
    ptr->is_end = true;
}

bool WordDictionary::search(std::string word) {
    const char *word_ptr = word.c_str();
    return search_trie(this->_trie_tree, word_ptr);
}

bool WordDictionary::search_trie(TrieNode *node, const char *word) {
    if (*word == '\0') {
        return node->is_end;
    }
    if (*word == '.') {
        for (int i = 0; i < TRIE_MAX_CHAR_NUM; i++) {
            if (node->child[i] && search_trie(node->child[i], word+1)) {
                return true;
            }
        }
    } else {//'a'-'z'
        int pos = *word - 'a';
        if (node->child[pos] && search_trie(node->child[pos], word+1)) {
            return true;
        }
    }
    return  false;
}
