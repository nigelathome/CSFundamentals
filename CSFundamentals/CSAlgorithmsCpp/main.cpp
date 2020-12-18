//
//  main.cpp
//  CSAlgorithmsCpp
//
//  Created by Hui,Li on 2020/11/21.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#include <iostream>

using namespace std;

int main(int argc, const char * argv[]) {
    std::cout << "Hello, US!\n";
    std::cout << "Hello, CHINA!\n";
    
    Solution8 solve;
    std::string s1 = "abcabcbb";
    std::string s2 = "bbbbb";
    std::string s3 = "pwgkew";
    std::string s4 = "aabaab!bb";
    int max1 = solve.lengthOfLongestSubstring(s4);
//    int max2 = solve.lengthOfLongestSubstring(s2);
//    int max3 = solve.lengthOfLongestSubstring(s3);
//    int max4 = solve.lengthOfLongestSubstring(s4);
//    printf("%d %d %d\n", max1, max2, max3);
    
    return 0;
}
