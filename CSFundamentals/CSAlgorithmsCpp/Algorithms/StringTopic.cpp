//
//  OtherTopic.cpp
//  CSAlgorithmsCpp
//
//  Created by Hui,Li on 2020/12/14.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#include "StringTopic.hpp"

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

bool Solution7::BF(std::string s, std::string t) {
    if (t.size()>s.size()) {
        return false;
    }
    int i=0, j=0;
    while(i<t.size() && j<s.size()) {
        if (s[j] == t[i]) {
            i++;
            j++;
        } else {
            i=0;
            j=j-i+1;
        }
    }
    if (i==t.size()) {
        return true;
    }
    return false;
}

int Solution7::maxProfit(std::vector<int>& prices) {
    if(prices.size()==0 || prices.size()==1) return 0;
    int max_profit = 0;
    int profit = 0;
    int i=0, j=0;
    for(i=0; i<prices.size()-1; i++) {
        j=i+1;
        for(; j<prices.size(); j++) {
            profit = prices[j] - prices[i];
            if(max_profit<profit) {
                max_profit = profit;
            }
        }
    }
    return max_profit;
}

#pragma mark code-test
/*
 Solution7 solve;
     std::string num1 = "12";
     std::string num2 = "13";
 //    std::string result = solve.multiply(num1, num2);
 //    printf("%s * %s = %s\n", num1.data(), num2.data(), result.data());
     
     printf("%s * %s = %s\n", "123", "456", solve.multiply("123", "456").data());
 */

/*
 Solution7 solve;
 std::string t = "youzan";
 std::string s = "zanyouzanyou";
 std::string a = s + s;
 bool match = solve.BF(s, t);
 std::cout << std::boolalpha << match << endl;
 */
