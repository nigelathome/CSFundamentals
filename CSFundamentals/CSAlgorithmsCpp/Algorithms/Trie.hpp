//
//  Trie.hpp
//  CSAlgorithmsCpp
//
//  Created by Hui,Li on 2020/11/21.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#ifndef Trie_hpp
#define Trie_hpp

#include <stdio.h>
#include <string>
#include <vector>

#define TRIE_MAX_CHAR_NUM 26

struct TrieNode {
    TrieNode *child[TRIE_MAX_CHAR_NUM];
    bool is_end;
    TrieNode() : is_end(false) {
        for (int i=0; i < TRIE_MAX_CHAR_NUM; i++) {
            child[i] = 0;
        }
    }
    void preorder_trie(TrieNode *node, int layer);
};

#endif /* Trie_hpp */
