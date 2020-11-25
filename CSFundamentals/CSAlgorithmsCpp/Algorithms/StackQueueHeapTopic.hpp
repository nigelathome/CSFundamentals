//
//  StackQueueHeapTopic.hpp
//  CSAlgorithmsCpp
//
//  Created by Hui,Li on 2020/11/24.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#ifndef StackQueueHeapTopic_hpp
#define StackQueueHeapTopic_hpp

#include <stdio.h>

class Solution1 {
public:
};

//225. 用队列实现栈
class MyStack {
public:
    MyStack();
    void push(int x);
    int pop();
    int top();
    bool empty();

    std::queue<int> _data;
};

#endif /* StackQueueHeapTopic_hpp */
