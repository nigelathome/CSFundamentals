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
    
    Solution solve;
    int result = solve.lastRemaining(5, 3);
    printf("%d, %d", solve.lastRemaining(5, 3), solve.lastRemaining(10, 17));
    
    return 0;
}
