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

bool Solution1::validateStackSequences(std::vector<int>& pushed, std::vector<int>& popped) {
    if (pushed.size() != popped.size()) {
        return false;
    }
    std::queue<int> tmp_queue;
    std::stack<int> tmp_stack;
    //出栈序列保存在队列中
    for (int i = 0; i<popped.size(); i++) {
        tmp_queue.push(popped[i]);
    }
    //借助栈和队列比较 将入栈元素依次入栈 如果栈顶元素和队头元素相等 出栈且出队列
    for (int i = 0; i<pushed.size(); i++) {
        tmp_stack.push(pushed[i]);
        while (!tmp_stack.empty()
               && tmp_stack.top() == tmp_queue.front()) {
            tmp_queue.pop();
            tmp_stack.pop();
        }
    }
    //栈不空栈序列不合法
    return tmp_stack.empty();
}

int Solution1::findKthLargest(std::vector<int>& nums, int k) {
    //维护一个k大小的小根堆 记录数组中最大的k个元素 那么堆顶元素就是k个最大元素中最小的那个也就是第k大的元素
    std::priority_queue<int, std::vector<int>, std::greater<int>> small_heap;
    for (int i=0; i<nums.size(); i++) {
        if (small_heap.size()<k) {
            small_heap.push(nums[i]);
        } else {
            if (nums[i] > small_heap.top()) {
                small_heap.pop();
                small_heap.push(nums[i]);
            }
        }
    }
    return small_heap.top();
}

MedianFinder::MedianFinder() {

}

void MedianFinder::addNum(int num) {
    //三种情况
    //大根堆元素和小根堆元素相等 比较大根堆堆顶元素和num关系
    if (big_heap.size() == small_heap.size()) {
        if (big_heap.empty() || num > big_heap.top()) {
            small_heap.push(num);
        } else {
            big_heap.push(num);
        }
    //大根堆元素比小根堆元素多 比较大根堆堆顶和num关系
    } else if (big_heap.size() > small_heap.size()) {
        if (num > big_heap.top()) {
            small_heap.push(num);
        } else {
            small_heap.push(big_heap.top());
            big_heap.pop();
            big_heap.push(num);
        }
    //大根堆元素比小根堆元素小 比较小根堆堆顶和num关系
    } else if (big_heap.size() < small_heap.size()) {
        if (num > small_heap.top()) {
            big_heap.push(small_heap.top());
            small_heap.pop();
            small_heap.push(num);
        } else {
            big_heap.push(num);
        }
    }
}

double MedianFinder::findMedian() {
    if (big_heap.size() == small_heap.size()) {
        return (double)(big_heap.top() + small_heap.top())/2;
    } else if (big_heap.size() > small_heap.size()) {
       return (double)big_heap.top();
    }
    return (double)small_heap.top();
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

/*
 MinStack S;
    S.push(-2);
    S.push(0);
    S.push(-5);
    S.push(1);
    printf("top = [%d] min = [%d]\n", S.top(), S.getMin());
    S.pop();
    printf("top = [%d] min = [%d]\n", S.top(), S.getMin());
    S.pop();
    printf("top = [%d] min = [%d]\n", S.top(), S.getMin());
    S.pop();
 */

/*
 Solution1 solve;
 std::vector<int> pushed;
 std::vector<int> popped;
 for (int i=1; i<=5; i++) {
     pushed.push_back(i);
 }
 popped.push_back(4);
 popped.push_back(5);
 popped.push_back(3);
 popped.push_back(2);
 popped.push_back(1);
 
 bool validate = solve.validateStackSequences(pushed, popped);
 std::cout << std::boolalpha << validate << endl;
 
 popped.clear();
 popped.push_back(4);
 popped.push_back(3);
 popped.push_back(5);
 popped.push_back(1);
 popped.push_back(2);
 validate = solve.validateStackSequences(pushed, popped);
 std::cout << std::boolalpha << validate << endl;
 
 popped.clear();
 popped.push_back(5);
 popped.push_back(4);
 popped.push_back(1);
 popped.push_back(2);
 popped.push_back(3);
 validate = solve.validateStackSequences(pushed, popped);
 std::cout << std::boolalpha << validate << endl;
 
 popped.clear();
 popped.push_back(1);
 popped.push_back(2);
 popped.push_back(3);
 popped.push_back(4);
 popped.push_back(5);
 validate = solve.validateStackSequences(pushed, popped);
 std::cout << std::boolalpha << validate << endl;
 
 pushed.clear();
 for (int i=1; i<=6; i++) {
     pushed.push_back(i);
 }
 popped.clear();
 popped.push_back(6);
 popped.push_back(5);
 popped.push_back(4);
 popped.push_back(3);
 popped.push_back(2);
 popped.push_back(1);
 validate = solve.validateStackSequences(pushed, popped);
 std::cout << std::boolalpha << validate << endl;
 */

/*
 std::priority_queue<int> big_heap;//默认大根堆
 std::priority_queue<int, std::vector<int>, std::greater<int>> small_heap;//小根堆
 std::priority_queue<int, std::vector<int>, std::less<int>> big_heap1;//大根堆
 
 int test[] = {6, 10, 1, 7, 99, 4, 33};
 for (int i=0; i<7; i++) {
     big_heap.push(test[i]);
 }
 printf("big_heap.top = %d\n", big_heap.top());
 big_heap.push(1000);
 printf("big_heap.top = %d\n", big_heap.top());
 for (int i=0; i<3; i++) {
     big_heap.pop();
 }
 printf("big_heap.top = %d\n", big_heap.top());
 printf("big_heap.top = %lu\n", big_heap.size());
 
 std::vector<int> nums;
 nums.push_back(6);
 nums.push_back(10);
 nums.push_back(1);
 nums.push_back(7);
 nums.push_back(99);
 nums.push_back(4);
 nums.push_back(33);
 
 Solution1 solve;
 int value = solve.findKthLargest(nums, 2);
 printf("%d\n", value);
 */

/*
 MedianFinder obj;
 obj.addNum(1);
 obj.addNum(2);
 double median = obj.findMedian();
 printf("%.2f\n", median);
 obj.addNum(4);
 median = obj.findMedian();
 printf("%.2f\n", median);
 obj.addNum(3);
 median = obj.findMedian();
 printf("%.2f\n", median);
 */
