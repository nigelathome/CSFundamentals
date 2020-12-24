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

int Solution7::countWords(std::string a) {
    if (a.size()==0) {
        return 0;
    }
    int i=0, words = 0;
    while(i<a.size()) {
        while (a[i] == ' ') {
            i++;
        }
        if(i<a.size()) words++;
        while (a[i]!=' ') {
            i++;
        }
    }
    return words;
}

std::string Solution7::replaceSpace(std::string s) {
    //扫描一遍s确定空格的个数
    int space = 0;
    for(int i=0; i<s.size(); i++){
        if(s[i]==' ') space++;
    }
    if(space==0) return s;
    int i = (int)s.size()-1, j=i+space*2;//i j 分别指向新旧数组的最后一个下标
    int ex_len = space*2 ;//替换之后数组的增加长度 是空格个数*2 因为替换后占三个字符 多出2个字符
    while(ex_len) {//扩充s的长度为替换后的长度
        s.push_back('0');
        ex_len--;
    }
    while(i<j) {//(j-i)/2就是还需要替换的空格个数 i=j说明空格已经替换完
        if(s[i]!=' ') {
            s[j] = s[i];//原样复制
        } else {
            s[j] = '0';//替换并改变j的位置
            s[j-1] = '2';
            s[j-2] = '%';
            j-=2;
        }
        i--;
        j--;
    }
    return s;
}

bool Solution7::isValid(std::string s) {
    std::stack<char> st;
     char cu = 0;
    //遍历每个字符 对于"(" 、"{" 、"["就入栈
    //而")" 、"}" 、"]"则比较栈顶元素匹配则出栈顶元素继续遍历 否则返回不匹配
     for(int i=0; i<s.length(); i++) {
         switch (s[i]) {
             case '(':
             case '{':
             case '[':
                 st.push(s[i]);
                 break;
             case ')':
             case '}':
             case ']': {
                 if(st.empty()) {
                     return false;
                 }
                 cu = st.top();
                 if((s[i]==')' && cu=='(')
                     ||(s[i]=='}' && cu=='{')
                     ||(s[i]==']' && cu=='[')) {
                     st.pop();
                     break;
                 } else {
                     return false;
                 }
                 break;
             }
                 
          default:
            break;
         }
     }
     return st.empty();
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

/*
 std::vector<int> A{3472,7789,7955,-7098,-9281,6101,5051,7778,3090,7423,-7151,5652,1595,-8094,677,-8324,8347,-2482,9313,-9338,-3157,8559,6945,3618,3087,121,-8468,3225,1356,6939,2799,-7231,-6309,-5453,633,-8689,-4776,2714,-2743,-1409,5918,-3333,1803,8330,-2206,-6117,-4486,-7903,-4375,-3739,2897,8056,-5864,-522,7451,-4541,-2813,5790,-532,-6517,925};
 long long val = solve.maxValue(A);
 printf("%lld\n", val);
 */

/*
 Solution7 solve;
 std::string a = "hello kkk  gwo;dsljljksaf  jjj studf";
 int val = solve.countWords(a);
 printf("%d", val);
 */

/*
 std::string s = "Happy Christmas Day!";
 Solution7 solve;
 s = solve.replaceSpace(s);
 std::cout << s << endl;
 */
