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
struct CacheNode {//该结构记录键值对和出现的频率
    int key;//建
    int value;//值
    int freq;//频率
    
    CacheNode *llink;//多个频率相同的结点组成链表
    CacheNode *rlink;//多个频率相同的结点组成链表
    //插入结点使用尾插法 删除结点从头部删除
    CacheNode(int k, int v) : key(k), value(v), freq(1), llink(NULL), rlink(NULL) {}
};

class LFUCache {
public:
    int _capacity;
    int _cur;
    
    std::map<int, CacheNode *> _key_map;//保存键key和结点的地址
    std::vector<CacheNode *> _freq_vec;//第i项保存出现频率都是i的结点 多个相同频率的结点构成双向链表
    
    LFUCache(int capacity);
    int get(int key);
    void put(int key, int value);
    
    //调整LFU的key出现的频率
    void update_LFU(int key);
    
    //插入新key
    void insert_LFU(int key, int value);

    //删除最不常用的key
    void delete_LFU();
};

#endif /* HashTopic_hpp */
