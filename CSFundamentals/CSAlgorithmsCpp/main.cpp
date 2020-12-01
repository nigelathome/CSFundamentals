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
    
    std::vector<int> nums;
    nums.push_back(1);
    nums.push_back(2);
    nums.push_back(2);
    Solution3 solve;
    std::vector<std::vector<int>> result = solve.subsetsWithDup(nums);
    for (int i=0; i<result.size(); i++) {
        for (int j=0; j<result[i].size(); j++) {
            printf("%d", result[i][j]);
        }
        printf("\n");
    }
    
    return 0;
}
