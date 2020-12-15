//
//  OtherTopic.cpp
//  CSAlgorithmsCpp
//
//  Created by Hui,Li on 2020/12/14.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#include "OtherTopic.hpp"

std::string Solution7::multiply(std::string num1, std::string num2) {
    std::string result;
    if(num1.size() < num2.size()) std::swap(num1, num2);
    int k = (int)num1.size()+1;
    std::reverse(num1.begin(), num1.end());
    std::reverse(num2.begin(), num2.end());
    while (num2.size()<k) {
        num2+='0';//短的字符串补0
    }
    
    int bit = 0;//进位
    int val = 0;//每位的值
    for(int i=0; i<=k; i++) {
        val = 0;
        for(int j = i; j>=0; j--){//长字符的下标
            if (j>=num1.size() || i-j>=num1.size()) {
                continue;
            }
            val += (num1[j]-'0')*(num2[i-j]-'0');
        }
        val += bit;
        result.push_back(val%10+'0');
        bit = val/10;
    }
    while (bit) {
        result.push_back(bit%10+'0');
        bit/=10;
    }
    std::reverse(result.begin(), result.end());
    return result;
}
