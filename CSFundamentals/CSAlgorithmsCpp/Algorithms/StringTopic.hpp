//
//  OtherTopic.hpp
//  CSAlgorithmsCpp
//
//  Created by Hui,Li on 2020/12/14.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#ifndef OtherTopic_hpp
#define OtherTopic_hpp

#include <stdio.h>
class Solution7 {
public:
    //43. 字符串相乘
    std::string multiply(std::string num1, std::string num2);
    
    //BF算法模式匹配
    bool BF(std::string s, std::string t);
    
    //NC7 买卖股票的最好时机
    int maxProfit(std::vector<int>& prices);
    
    //NC106 三个数最大的乘积
    long long maxValue(std::vector<int> A);
    
    //面试题 统计单词个数
    int countWords(std::string a);
    
    //剑指 Offer 05. 替换空格
    std::string replaceSpace(std::string s);
       
};

#endif /* OtherTopic_hpp */
