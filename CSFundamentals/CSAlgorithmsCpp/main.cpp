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
    
    MyStack S;
    S.push(1);
    S.push(2);
    S.push(3);
    S.push(4);
    printf("%d\n", S.top());
    S.pop();
    printf("%d\n", S.top());
    S.push(5);
    printf("%d\n", S.top());
  
    return 0;
}
