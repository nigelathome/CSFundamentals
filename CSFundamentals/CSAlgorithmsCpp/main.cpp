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
    
    Solution7 sovle;
    std::vector<std::string> strs{"abca","abc","abca","abc","abcc"};
    std::string com = sovle.longestCommonPrefix(strs);
    
    printf("%s\n", com.c_str());
    
    return 0;
}
