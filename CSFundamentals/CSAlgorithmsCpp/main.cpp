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
    
    Solution7 solve;
    std::vector<int> A{3472,7789,7955,-7098,-9281,6101,5051,7778,3090,7423,-7151,5652,1595,-8094,677,-8324,8347,-2482,9313,-9338,-3157,8559,6945,3618,3087,121,-8468,3225,1356,6939,2799,-7231,-6309,-5453,633,-8689,-4776,2714,-2743,-1409,5918,-3333,1803,8330,-2206,-6117,-4486,-7903,-4375,-3739,2897,8056,-5864,-522,7451,-4541,-2813,5790,-532,-6517,925};
    long long val = solve.maxValue(A);
    printf("%lld\n", val);
    
    return 0;
}
