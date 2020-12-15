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

long long Solution7::maxValue(std::vector<int> A) {
    if(A.size()<3) return 0;
    long long result;
    int max1 = INT_MIN, max2 = INT_MIN, max3 = INT_MIN;
    int min1 = INT_MAX, min2 = INT_MAX;
    for(int i=0; i<A.size(); i++) {
        if(A[i]>0) {
            if(A[i]>max1) {
              max3 = max2;
              max2 = max1;
              max1 = A[i];
              } else if( A[i]>max2) {
                  max3 = max2;
                  max2 = A[i];
              } else if(A[i]>max3) {
                  max3 = A[i];
              }
          }else if(A[i] < 0) {
              if(A[i]<min1) {
                  min2 = min1;
                  min1 = A[i];
              } else if(A[i]>min1 && A[i]<min2) {
                  min2 = A[i];
              }
          }
      }
    
      result = std::max((long long)max1*max2*max3, (long long)max1*min1*min2);
      return result;
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

/*
 Solution7 solve;
 std::vector<int> prices{1, 4, 2};
 int profit = solve.maxProfit(prices);
 printf("%d\n", profit);
 */
