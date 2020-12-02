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
    
    Solution4 solve;
    std::vector<int> arr;
    arr.push_back(5);
    arr.push_back(4);
    arr.push_back(3);
    arr.push_back(2);
    arr.push_back(1);
    solve.MySort(arr);
    for (int i=0; i<arr.size(); i++) {
        printf("[%d]\n", arr[i]);
    }
    
    return 0;
}
