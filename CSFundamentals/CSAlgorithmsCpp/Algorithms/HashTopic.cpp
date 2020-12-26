//
//  HashTopic.cpp
//  CSAlgorithmsCpp
//
//  Created by Hui,Li on 2020/12/17.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#include "HashTopic.hpp"

//检测是否有重复元素
bool repeatIn(std::string s) {
    std::set<char> char_set;
    for(auto x : s) {
        if(char_set.find(x) == char_set.end()) {
            char_set.insert(x);
        } else {
            return true;;
        }
    }
    return false;
}

//int Solution8::lengthOfLongestSubstring(std::string arr) {
//    //暴力枚举法拿到所有子序列 从长度大到小的方式检查是否有重复 输出最长的没有重复的子序列
//    if(arr.size()==0) return 0;
//    std::vector<std::string> sub;
//    std::string item;
//    std::string result;
//    for(int len=(int)arr.size(); len>=1; len--) {
//        for(int i=0; i<arr.size(); i++) {
//            int j = i;
//            if(j+len<=arr.size()) {
//                int k = 0;
//                while(k<len) {
//                    item.push_back(arr[j]);
//                    k++;
//                    j++;
//                }
//                sub.push_back(item);
//                item.clear();
//            }
//        }
//    }
//
//    for(int i=0; i<sub.size(); i++) {
//        bool repeat = repeatIn(sub[i]);
//        if(!repeat) {
//            result = sub[i];
//            break;
//        }
//    }
//    return (int)result.size();
//}

//int Solution8::lengthOfLongestSubstring(std::string arr) {
//    //滑动窗口方法
//    if(arr.size()==0) return 0;
//    std::map<int, int> hash;
//    int result = 0, cur = 1;
//    for(int i=0; i<arr.size(); i++) {
//        int j=i+1;
//        hash[arr[i]] = 1;
//        cur = 1;
//        while(j<arr.size()) {
//            if (hash.find(arr[j])!=hash.end()) {
//                break;
//            } else {
//                hash[arr[j]] = 1;
//                cur++;
//                j++;
//            }
//        }
//        result = std::max(result, cur);
//        hash.clear();
//    }
//    return result;
//}

int Solution8::lengthOfLongestSubstring(std::string arr) {
    //优化滑动窗口方法
    if(arr.size()==0) return 0;
    std::map<char, int> hash;//元素值和对应下标
    int result = 1;
    int cur_length = 0;
    int i=0, j=0;//表示滑动窗口的起始和终止位置
    for(; j<arr.size(); j++) {
        if(hash.find(arr[j]) == hash.end()) {
            hash[arr[j]] = j;
            cur_length++;
        } else {
            result = std::max(result, cur_length);
            i = std::max(hash[arr[j]], i);//i指向重复元素出现的下标的下一个下标
            cur_length = j - i;
            hash[arr[j]] = j;
        }
    }
    result = std::max(result, cur_length);
    
    return result;
}

LRUCache::LRUCache(int capacity) {
    _capacity = capacity;
    _head = new DListNode(0);
    _tail = new DListNode(0);
    _head->rlink = _tail;
    _tail->llink = _head;
}

int LRUCache::get(int key) {
    if (_hash.find(key) == _hash.end()) {
        return -1;
    } else {
        update_LRU(key);
        return _hash[key];
    }
}
    
void LRUCache::put(int key, int value) {
    if (_hash.find(key) != _hash.end()) {
        update_LRU(key);//更新缓存
    } else {
        if (_cur == _capacity) {
            //删这个（key, value)
            int d = _head->rlink->val;
            _hash.erase(d);
            delete_LRU();
        } else {
            _cur++;
        }
        insert_LRU(key);
    }
    _hash[key] = value;
}

void LRUCache::insert_LRU(int key) {
    DListNode *pt = new DListNode(key);
    //插入尾部
    pt->rlink = _tail;
    pt->llink = _tail->llink;
    _tail->llink->rlink = pt;
    _tail->llink = pt;
}

void LRUCache::delete_LRU() {
    DListNode *pt = _head->rlink;
    _head->rlink = pt->rlink;
    pt->rlink->llink = _head;
    delete pt;
}

void LRUCache::update_LRU(int key) {
    DListNode *pt = _head;
    while(pt) {
        if (pt->val == key) {//找到该key
            break;
        } else {
            pt = pt->rlink;
        }
    }
    //将key更新到链表尾部
    //删除key
    pt->llink->rlink = pt->rlink;
    pt->rlink->llink = pt->llink;
    
    //插入尾部 _tail之前
    pt->rlink = _tail;
    pt->llink = _tail->llink;
    _tail->llink->rlink = pt;
    _tail->llink = pt;
}

#pragma mark code-test
/*
 Solution8 solve;
 std::string s1 = "abcabcbb";
 std::string s2 = "bbbbb";
 std::string s3 = "pwgkew";
 std::string s4 = "aabaab!bb";
 int max1 = solve.lengthOfLongestSubstring(s4);
 int max2 = solve.lengthOfLongestSubstring(s2);
 int max3 = solve.lengthOfLongestSubstring(s3);
 int max4 = solve.lengthOfLongestSubstring(s4);
 printf("%d %d %d %d\n", max1, max2, max3, max4);
 */
