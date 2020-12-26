//
//  HashTopic.hpp
//  CSAlgorithmsCpp
//
//  Created by Hui,Li on 2020/12/17.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#ifndef HashTopic_hpp
#define HashTopic_hpp

#include <stdio.h>
class Solution8 {
public:
    //3. 无重复字符的最长子串
    int lengthOfLongestSubstring(std::string s);
};

//146. LRU 缓存机制
class LRUCache {
public:
    
    std::vector<int> _vec;//保存最近的缓存 淘汰最不常使用的key
    std::map<int, int> _hash;//存储当前（key,value)
    int _capacity = 0;
    
    LRUCache(int capacity);
    int get(int key);
    void put(int key, int value);
    
    //调整LRU的key
    void updateLRU(int key);
};

#endif /* HashTopic_hpp */
