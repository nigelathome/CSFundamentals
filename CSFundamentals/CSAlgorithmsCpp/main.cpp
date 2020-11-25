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
    
    MinStack S;
    S.push(-2);
    S.push(0);
    S.push(-5);
    S.push(1);
    printf("top = [%d] min = [%d]\n", S.top(), S.getMin());
    S.pop();
    printf("top = [%d] min = [%d]\n", S.top(), S.getMin());
    S.pop();
    printf("top = [%d] min = [%d]\n", S.top(), S.getMin());
    S.pop();
    
    return 0;
}
