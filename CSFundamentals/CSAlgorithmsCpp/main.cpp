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
    
    std::vector<int> nums = {5, 7, 7, 8, 8, 8, 8, 10};
    Solution6 solve;
    for(int i=0; i<12; i++) {
        std::vector<int> result = solve.searchRange(nums, i);
        printf("target=%d, [%d, %d]\n", i, result[0], result[1]);
    }
    
    return 0;
}
