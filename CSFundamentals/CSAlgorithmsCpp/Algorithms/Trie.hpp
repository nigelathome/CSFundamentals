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
    
    //前序遍历trie树
    void preorder_trie(TrieNode *node, int layer);
    
    //获取trie树全部单词
    void get_all_word_from_trie(TrieNode *node, std::string &word, std::vector<std::string>&word_list);
};

#endif /* Trie_hpp */
