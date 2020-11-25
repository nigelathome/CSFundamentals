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
