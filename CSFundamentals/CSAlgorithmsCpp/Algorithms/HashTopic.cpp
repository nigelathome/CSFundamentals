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

int Solution8::lengthOfLongestSubstring(std::string arr) {
    //滑动窗口方法
    if(arr.size()==0) return 0;
    std::map<int, int> hash;
    int result = 0, cur = 1;
    for(int i=0; i<arr.size(); i++) {
        int j=i+1;
        hash[arr[i]] = 1;
        cur = 1;
        while(j<arr.size()) {
            if (hash.find(arr[j])!=hash.end()) {
                break;
            } else {
                hash[arr[j]] = 1;
                cur++;
                j++;
            }
        }
        result = std::max(result, cur);
        hash.clear();
    }
    return result;
}
