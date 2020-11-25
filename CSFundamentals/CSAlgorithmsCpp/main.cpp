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
    
    MyQueue Q;
    Q.push(1);
    Q.push(2);
    Q.push(3);
    Q.push(4);
    printf("%d\n", Q.peek());
    Q.pop();
    printf("%d\n", Q.peek());
  
    return 0;
}
