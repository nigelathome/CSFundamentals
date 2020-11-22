//
//  TrieTopic.hpp
//  CSAlgorithmsCpp
//
//  Created by Hui,Li on 2020/11/21.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#ifndef TrieTopic_hpp
#define TrieTopic_hpp

//211. 添加与搜索单词 - 数据结构设计
class WordDictionary {
public:
    WordDictionary();
    
    //插入单词
    void addWord(std::string word);
    
    //查找单词
    bool search(std::string word);
    bool search_trie(TrieNode *node, const char *word);
    
    TrieNode *_trie_tree;
};

#endif /* TrieTopic_hpp */
