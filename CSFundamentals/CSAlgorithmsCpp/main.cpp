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
    
    Solution7 solve;
    std::vector<int> prices{1, 4, 2};
    int profit = solve.maxProfit(prices);
    printf("%d\n", profit);
    
    return 0;
}
