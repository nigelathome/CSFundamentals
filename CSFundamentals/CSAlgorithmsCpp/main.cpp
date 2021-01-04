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
    std::vector<int> arr{5, 2, 3};
    int result = solve.minMoney(arr, 2);
    printf("%d\n", result);
    
    return 0;
}
