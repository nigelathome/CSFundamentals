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
    
    //head-结点1-结点2-结点3-...-tail 约靠近tail越常使用
    //在tail处插入新key 在head淘汰key
    DListNode *_head, *_tail;//使用双向链表保存最近的缓存 淘汰最不常使用的key
    
    //保存key和value
    std::map<int, int> _hash;//存储当前（key,value)
    
    int _capacity = 0;
    int _cur = 0;//记录当前的key个数
    
    LRUCache(int capacity);
    int get(int key);
    void put(int key, int value);
    
    //调整LRU的key
    void update_LRU(int key);
    
    //插入新key
    void insert_LRU(int key);

    //删除最不常用的key
    void delete_LRU();
};

//460. LFU 缓存
class LFUCache {
public:
    //缓存key 记录最少使用的key 按从小到大排序
    std::vector<std::pair<int, int>> _cache;//pair的first和second分别表示key和出现的次数
    int _capacity;
    int _cur;
    std::map<int, int> _hash;
    
    LFUCache(int capacity);
    int get(int key);
    void put(int key, int value);
    
    //调整LFU的key
    void update_LFU(int key);
    
    //对key从小到大排序
    void sort_LFU();
    
    //插入新key
    void insert_LFU(int key);

    //删除最不常用的key
    void delete_LFU();
};

#endif /* HashTopic_hpp */
