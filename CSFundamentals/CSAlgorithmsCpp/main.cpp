//
//  main.cpp
//  CSAlgorithmsCpp
//
//  Created by Hui,Li on 2020/11/21.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#include <iostream>

using namespace std;

void calculate(int n, int &sum) {
    if (n==0) {
        return;
    }
    sum += n;
    calculate(n-1, sum);
}

int main(int argc, const char * argv[]) {
    std::cout << "Hello, US!\n";
    std::cout << "Hello, CHINA!\n";
    
    int sum = 0;
    calculate(20, sum);
    printf("%d\n", sum);
    
    return 0;
}
