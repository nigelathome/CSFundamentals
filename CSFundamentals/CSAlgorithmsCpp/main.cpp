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
    
    Solution solve;
    ListNode a(10), b(20), c(30), d(40);
    a.next = &b;
    b.next = &c;
    c.next = &d;
    ListNode *head = &a;
    solve.reorderList(head);
    CommonUtil commonUtil;
    commonUtil.print_linked_list(head);
    
    return 0;
}
