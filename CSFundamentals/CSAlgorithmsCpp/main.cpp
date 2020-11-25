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
    
    Solution1 solve;
    std::vector<int> pushed;
    std::vector<int> popped;
    for (int i=1; i<=5; i++) {
        pushed.push_back(i);
    }
    popped.push_back(4);
    popped.push_back(5);
    popped.push_back(3);
    popped.push_back(2);
    popped.push_back(1);
    
    bool validate = solve.validateStackSequences(pushed, popped);
    std::cout << std::boolalpha << validate << endl;
    
    popped.clear();
    popped.push_back(4);
    popped.push_back(3);
    popped.push_back(5);
    popped.push_back(1);
    popped.push_back(2);
    validate = solve.validateStackSequences(pushed, popped);
    std::cout << std::boolalpha << validate << endl;
    
    popped.clear();
    popped.push_back(5);
    popped.push_back(4);
    popped.push_back(1);
    popped.push_back(2);
    popped.push_back(3);
    validate = solve.validateStackSequences(pushed, popped);
    std::cout << std::boolalpha << validate << endl;
    
    popped.clear();
    popped.push_back(1);
    popped.push_back(2);
    popped.push_back(3);
    popped.push_back(4);
    popped.push_back(5);
    validate = solve.validateStackSequences(pushed, popped);
    std::cout << std::boolalpha << validate << endl;
    
    pushed.clear();
    for (int i=1; i<=6; i++) {
        pushed.push_back(i);
    }
    popped.clear();
    popped.push_back(6);
    popped.push_back(5);
    popped.push_back(4);
    popped.push_back(3);
    popped.push_back(2);
    popped.push_back(1);
    validate = solve.validateStackSequences(pushed, popped);
    std::cout << std::boolalpha << validate << endl;
  
    return 0;
}
