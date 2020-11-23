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
    
    std::map<Node *, int> node_map;
    Node a(1), b(2), c(3), d(4), e(5);
    a.next = &b;
    b.next = &c;
    c.next = &d;
    d.next = &e;
    a.random = &c;
    b.random = &d;
    c.random = &c;
    e.random = &d;
    
    Solution solve;
    Node *head = solve.copyRandomList(&a);
    CommonUtil *commonUtil = new CommonUtil();
    commonUtil->print_random_linked_list(head);
    
    return 0;
}
