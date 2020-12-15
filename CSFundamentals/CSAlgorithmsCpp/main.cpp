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
    
    Solution7 solve;
    std::string num1 = "12";
    std::string num2 = "13";
//    std::string result = solve.multiply(num1, num2);
//    printf("%s * %s = %s\n", num1.data(), num2.data(), result.data());
    
    printf("%s * %s = %s\n", "123", "456", solve.multiply("123", "456").data());
    
    return 0;
}
