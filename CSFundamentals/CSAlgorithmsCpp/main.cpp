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
    
    Solution3 solve;
    std::vector<std::vector<int>> matrix{{1,3,5,9}, {8,1,3,4}, {5,0,6,1}, {8,8,4,0}};
    int result = solve.minPathSum(matrix);
    printf("%d\n", result);
    
    
    return 0;
}
