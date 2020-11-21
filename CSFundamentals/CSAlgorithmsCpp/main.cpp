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

using namespace std;

int main(int argc, const char * argv[]) {
    std::cout << "Hello, US!\n";
    std::cout << "Hello, CHINA!\n";
    
    Trie *trie = new Trie();
//    trie->insert("abcdef");
//    TrieNode *root = trie->_root;
//    root->preorder_trie(root, 0);
    
    trie->insert("apple");
    bool par1 = trie->search("apple");   // 返回 true
    bool par2 = trie->search("app");     // 返回 false
    bool par3 = trie->startsWith("app"); // 返回 true
    trie->insert("app");
    bool par4 = trie->search("app");     // 返回 true
    TrieNode *root = trie->_root;
    root->preorder_trie(root, 0);
    std::cout << std::boolalpha << par1 << endl;
    std::cout << std::boolalpha << par2 << endl;
    std::cout << std::boolalpha << par3 << endl;
    std::cout << std::boolalpha << par4 << endl;

    return 0;
}
