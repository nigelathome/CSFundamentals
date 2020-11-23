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
    
    ListNode a1(1), a2(2), b1(3), b2(4), b3(5);
    ListNode c1(6), c2(7), c3(8);
    a1.next = &a2;
    a2.next = &c1;
    c1.next = &c2;
    c2.next = &c3;
    b1.next = &b2;
    b2.next = &b3;
    b3.next = &c1;
    Solution solve;
    ListNode *result = solve.getIntersectionNode(&a1, &b1);
    printf("%d\n", result->val);
    
    return 0;
}
