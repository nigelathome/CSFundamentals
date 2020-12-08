//
//  BinarySearch.cpp
//  CSAlgorithmsCpp
//
//  Created by Hui,Li on 2020/12/7.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#include "BinarySearchTopic.hpp"

int Solution6::upper_bound_(int n, int v, std::vector<int>& a) {
    int begin = 0, end = n-1;
    while(begin <= end) {
        int mid = (begin + end) / 2;
        if(a[mid] < v) {
            begin = mid + 1;
        } else if(a[mid] > v) {
            end = mid - 1;
            
        } else {
            if(mid== 0 || a[mid-1] != v) {
                return mid + 1;
            } else {
                end = mid - 1;
            }
        }
    }
    //找不到目标元素有两种可能：
    //目标比所有数要小 这时候 end<begin并且end==-1越界
    //目标比所有数要大 这时候 begin>end并且begin==n越界
    return begin >= n ? n+1 : 1;
}
