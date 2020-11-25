//
//  StackQueueHeapTopic.cpp
//  CSAlgorithmsCpp
//
//  Created by Hui,Li on 2020/11/24.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#include "StackQueueHeapTopic.hpp"

MyStack::MyStack() {
    
}

void MyStack::push(int x) {
    //临时的队列 每次把元素先入队列 再把_data中元素入队列
    std::queue<int> tmp_queue;
    tmp_queue.push(x);
    while (!_data.empty()) {
        tmp_queue.push(_data.front());
        _data.pop();
    }
    while (!tmp_queue.empty()) {
        _data.push(tmp_queue.front());
        tmp_queue.pop();
    }
}

int MyStack::pop() {
    int x = _data.front();
    _data.pop();
    return x;
}

int MyStack::top() {
    return _data.front();
}

bool MyStack::empty() {
    return _data.empty();
}

MyQueue::MyQueue() {
    
}

void MyQueue::push(int x) {
    std::stack<int> tmp_stack;
    //_data元素依次入临时栈 再把x入栈 之后临时栈元素依次入_data
    while (!_data.empty()) {
        tmp_stack.push(_data.top());
        _data.pop();
    }
    tmp_stack.push(x);
    while (!tmp_stack.empty()) {
        _data.push(tmp_stack.top());
        tmp_stack.pop();
    }
}

int MyQueue::pop() {
    int x = _data.top();
    _data.pop();
    return x;
}

int MyQueue::peek() {
    return _data.top();
}

bool MyQueue::empty() {
    return _data.empty();
}

MinStack::MinStack() {
    
}

void MinStack::push(int x) {
    _data.push(x);
    if (_min.empty()) {
        _min.push(x);
    } else {
        if (x > _min.top()) {
            x = _min.top();
        }
        _min.push(x);
    }
}

void MinStack::pop() {
    _data.pop();
    _min.pop();
}

int MinStack::top() {
    return _data.top();
}

int MinStack::getMin() {
    return _min.top();
}

#pragma mark code-test
/*
 MyStack S;
 S.push(1);
 S.push(2);
 S.push(3);
 S.push(4);
 printf("%d\n", S.top());
 S.pop();
 printf("%d\n", S.top());
 S.push(5);
 printf("%d\n", S.top());
 */

/*
 MyQueue Q;
 Q.push(1);
 Q.push(2);
 Q.push(3);
 Q.push(4);
 printf("%d\n", Q.peek());
 Q.pop();
 printf("%d\n", Q.peek());
 */
