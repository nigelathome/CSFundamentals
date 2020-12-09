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
    
    std::vector<int> nums = {9, 12, 15, 20, 1, 3, 6, 7};
    Solution6 solve;
    for(int i=0; i<22; i++) {
        int result = solve.search(nums, i);
        printf("target=%d, index=%d\n", i, result);
    }
    
    return 0;
}
