//
//  Trie.cpp
//  CSAlgorithmsCpp
//
//  Created by Hui,Li on 2020/11/21.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#include "Trie.hpp"

void TrieNode::get_all_word_from_trie(TrieNode* node,
                                      std::string &word,
                                      std::vector<std::string>&word_list) {
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

Trie::Trie() {
    _root = new TrieNode();
}

Trie::~Trie() {
    delete _root;
}

void Trie::insert(const std::string word) {
    TrieNode *ptr = this->_root;
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

bool Trie::search(const std::string word) {
    TrieNode *ptr = this->_root;
    for (auto it = word.begin(); it != word.end(); it++) {
        int pos = *it - 'a';
        if (!ptr->child[pos]) {
            return false;
        }
        ptr = ptr->child[pos];
    }
    return ptr->is_end;
}

bool Trie::startsWith(const std::string prefix) {
    TrieNode *ptr = this->_root;
    for (auto it = prefix.begin(); it != prefix.end(); it++) {
        int pos = *it - 'a';
        if (!ptr->child[pos]) {
            return false;
        }
        ptr = ptr->child[pos];
    }
    return true;
}

#pragma mark code-test
/*
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
 */

/*
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
 */

