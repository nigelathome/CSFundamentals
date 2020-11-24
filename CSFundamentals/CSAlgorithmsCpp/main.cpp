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
    
    ListNode a(1), b(4), c(6), d(0), e(5), f(7), g(2), h(3);
    a.next = &b;
    b.next = &c;
    d.next = &e;
    e.next = &f;
    g.next = &h;
    
    std::vector<ListNode *> lists;
    lists.push_back(&a);
    lists.push_back(&d);
    lists.push_back(&g);
    CommonUtil commonUtil;
    commonUtil.print_linked_list(&a);
    commonUtil.print_linked_list(&d);
    commonUtil.print_linked_list(&g);
    
    Solution solve;
    ListNode *head = solve.mergeKLists(lists);
    commonUtil.print_linked_list(head);
    
    return 0;
}
