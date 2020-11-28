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
    
    std::string num = "1432219";
    int k = 3;
    Solution2 solve;
    std::string result = solve.removeKdigits(num, k);
    printf("%s\n", result.c_str());
    
    num = "12345";
    k = 2;
    result = solve.removeKdigits(num, k);
    printf("%s\n", result.c_str());
    
    num = "100200";
    k = 2;
    result = solve.removeKdigits(num, k);
    printf("%s\n", result.c_str());
    
    num = "100200";
    k = 1;
    result = solve.removeKdigits(num, k);
    printf("%s\n", result.c_str());
    
    return 0;
}
