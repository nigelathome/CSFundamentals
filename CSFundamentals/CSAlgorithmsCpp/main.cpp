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
    return 0;
}
