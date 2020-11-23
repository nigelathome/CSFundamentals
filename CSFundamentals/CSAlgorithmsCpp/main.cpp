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
    
    ListNode a(1), b(4), c(3), d(2), e(5), f(2);
    a.next = &b;
    b.next = &c;
    c.next = &d;
    d.next = &e;
    e.next = &f;
    
    CommonUtil commonUtil;
    commonUtil.print_linked_list(&a);
    
    Solution solve;
    ListNode *result = solve.partition(&a, 3);
    commonUtil.print_linked_list(result);
    
    return 0;
}
