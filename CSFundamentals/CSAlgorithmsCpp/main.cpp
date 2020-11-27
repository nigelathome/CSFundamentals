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
    
    std::vector<int> g, s;
    g.push_back(1);
    g.push_back(2);
    g.push_back(3);
    s.push_back(1);
    s.push_back(1);
    Solution2 solve;
    int child = solve.findContentChildren(g, s);
    printf("%d\n", child);
    
    return 0;
}
