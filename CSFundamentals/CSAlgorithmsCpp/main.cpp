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
    
    int n = 3;
    Solution3 solve;
    std::vector<std::string> result = solve.generateParenthesis(n);
    for (int i=0; i<result.size(); i++) {
        string item = result[i];
        printf("%s\n", item.c_str());
    }
    
    return 0;
}
