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
    
    std::vector<std::vector<char>> board1 = {{'a','b','c','e'}, {'s','f','c','s'}, {'a','d','e','e'}};
    std::string word1 ="abcced";
    
    Solution3 solve;
    bool is_exist = solve.exist(board1, word1);
    std::cout << boolalpha << is_exist << endl;
    
    
    return 0;
}
