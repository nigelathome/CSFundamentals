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
    
    return 0;
}
