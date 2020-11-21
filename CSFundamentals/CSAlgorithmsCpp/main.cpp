//
//  main.cpp
//  CSAlgorithmsCpp
//
//  Created by Hui,Li on 2020/11/21.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#include <iostream>
#include <cstdio>
#include "Trie.hpp"

int main(int argc, const char * argv[]) {
    std::cout << "Hello, US!\n";
    std::cout << "Hello, CHINA!\n";
    
    Trie* obj = new Trie();
    obj->insert("abcdef");
    TrieNode *root = obj->_root;
    root->preorder_trie(root, 0);
    
    return 0;
}
