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
    
    std::vector<int> result;
    int val=0;
    
    LFUCache lFUCache(2);
    lFUCache.put(1, 1);
    lFUCache.put(2, 2);
    
    val = lFUCache.get(1);      // 返回 1
    result.push_back(val);
    
    lFUCache.put(3, 3);   // 去除键 2
    
    val = lFUCache.get(2);      // 返回 -1（未找到）
    result.push_back(val);
    
    val = lFUCache.get(3);      // 返回 3
    result.push_back(val);
    
    lFUCache.put(4, 4);   // 去除键 1
    
    val = lFUCache.get(1);      // 返回 -1（未找到）
    result.push_back(val);
    
    val = lFUCache.get(3);      // 返回 3
    result.push_back(val);

    val = lFUCache.get(4);      // 返回 4
    result.push_back(val);
    
    return 0;
}
