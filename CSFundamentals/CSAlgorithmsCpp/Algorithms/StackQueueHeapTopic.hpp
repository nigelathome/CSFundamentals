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

//232. 用栈实现队列
class MyQueue {
public:
    MyQueue();
    void push(int x);
    int pop();
    int peek();
    bool empty();
    
    std::stack<int> _data;
};

//155. 最小栈
class MinStack {
public:
    MinStack();
    void push(int x);
    void pop();
    int top();
    int getMin();
    
    std::stack<int> _data;
    std::stack<int> _min;
};

class Solution1 {
public:
    //946. 验证栈序列
    bool validateStackSequences(std::vector<int>& pushed, std::vector<int>& popped);
    
    //215. 数组中的第K个最大元素
    int findKthLargest(std::vector<int>& nums, int k);
    
};

#endif /* StackQueueHeapTopic_hpp */
