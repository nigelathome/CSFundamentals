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
    
    ListNode *a = new ListNode(4);
    ListNode *b = new ListNode(5);
    ListNode *c = new ListNode(1);
    ListNode *d = new ListNode(9);
    a->next = b;
    b->next = c;
    c->next = d;
    
    CommonUtil commonUtil;
    commonUtil.print_linked_list(a);
    
    Solution solve;
    solve.deleteNode(b);
    commonUtil.print_linked_list(a);
//    ListNode *head = solve.mergeKLists(lists);
//    commonUtil.print_linked_list(head);
    
    return 0;
}
