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
    
    TrieNode root, n1, n2, n3;
    root.child['a'-'a'] = &n1;
    root.child['b'-'a'] = &n2;
    root.child['e'-'a'] = &n3;
    n2.is_end = true;
    
    TrieNode n4, n5, n6;
    n1.child['b'-'a'] = &n4;
    n2.child['c'-'a'] = &n5;
    n3.child['f'-'a'] = &n6;
    
    TrieNode n7, n8, n9, n10;
    n4.child['c'-'a'] = &n7;
    n4.child['d'-'a'] = &n8;
    n5.child['d'-'a'] = &n9;
    n6.child['g'-'a'] = &n10;
    n7.is_end = true;
    n8.is_end = true;
    n9.is_end = true;
    n10.is_end = true;
    
    TrieNode n11;
    n7.child['d'-'a'] = &n11;
    n11.is_end = true;
    
//    root.preorder_trie(&root, 0);
    std::vector<std::string> word_list;
    std::string word;
    root.get_all_word_from_trie(&root, word, word_list);
    
    for (auto it = word_list.begin(); it != word_list.end(); it++) {
        std::cout << *it.base() << "\n";
    }
    
    return 0;
}
