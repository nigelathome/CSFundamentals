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
    
    ListNode a(10), b(20), c(30), d(40), e(50);
    a.next = &b;
    b.next = &c;
    c.next = &d;
    d.next = &e;
    e.next = NULL;
    ListNode *head = &a;
    while (head) {
        if (head == &a) {
            printf("%d", head->val);
        } else {
            printf("->%d", head->val);
        }
        head = head->next;
    }
    printf("\n");
    return 0;
}
