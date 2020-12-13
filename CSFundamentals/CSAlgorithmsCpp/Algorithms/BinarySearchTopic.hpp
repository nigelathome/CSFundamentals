//
//  BinarySearch.hpp
//  CSAlgorithmsCpp
//
//  Created by Hui,Li on 2020/12/7.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#ifndef BinarySearchTopic_hpp
#define BinarySearchTopic_hpp

#include <stdio.h>
class Solution6 {
public:
    //NC105 二分查找
    int upper_bound_(int n, int v, std::vector<int>& a);
    
    //34. 在排序数组中查找元素的第一个和最后一个位置
    std::vector<int> searchRange(std::vector<int>& nums, int target);
    
    //33. 搜索旋转排序数组
    int search(std::vector<int>& nums, int target);
    
    //剑指 Offer 04. 二维数组中的查找
    bool findNumberIn2DArray(std::vector<std::vector<int>>& matrix, int target);
    
    //153. 寻找旋转排序数组中的最小值
    int findMin(std::vector<int>& nums);
};

#endif /* BinarySearchTopic_hpp */
