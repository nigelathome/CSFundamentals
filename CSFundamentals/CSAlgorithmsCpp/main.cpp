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

    ListNode l1(1), b(4), c(6), l2(0), e(5), f(7);
    l1.next = &b;
    b.next = &c;
    
    l2.next = &e;
    e.next = &f;
    
    Solution solve;
    CommonUtil *commonUtil = new CommonUtil();
    commonUtil->print_linked_list(&l1);
    commonUtil->print_linked_list(&l2);
    
    ListNode *head = solve.mergeTwoLists(&l1, &l2);
    commonUtil->print_linked_list(head);
    
    return 0;
}
