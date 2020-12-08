//
//  BinarySearch.cpp
//  CSAlgorithmsCpp
//
//  Created by Hui,Li on 2020/12/7.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#include "BinarySearchTopic.hpp"

int Solution6::upper_bound_(int n, int v, std::vector<int>& a) {
    int begin = 0, end = n - 1;
    while (begin <= end) {
        int mid = (begin + end) / 2;
        if (a[mid] < v) {
            begin = mid + 1;
        } else if (a[mid] > v) {
            end = mid - 1;
        } else {
            if (mid == 0 || a[mid - 1] != v) {
                return mid + 1;
            } else {
                end = mid - 1;
            }
        }
    }
    //找不到目标元素有两种可能：
    //目标比所有数要小 这时候 end<begin并且end==-1越界
    //目标比所有数要大 这时候 begin>end并且begin==n越界
    return begin >= n ? n + 1 : 1;
}

int left_bound(std::vector<int> nums, int target) {
    int begin = 0, end = (int)nums.size() - 1;
    int mid = 0;
    while (begin <= end) {
        mid = (begin + end) / 2;
        if (nums[mid] == target) {
            if (mid == 0 || nums[mid - 1] != target) {
                //说明找到了最左边=target的下标
                return mid;
            } else {
                end = mid - 1;
            }
        } else if (nums[mid] > target) {
            end = mid - 1;
        } else if (nums[mid] < target) {
            begin = mid + 1;
        }
    }
    return -1;
}

int right_bound(std::vector<int> nums, int target) {
    int begin = 0, end = (int)nums.size() - 1;
    int mid = 0;
    while (begin <= end) {
        mid = (begin + end) / 2;
        if (nums[mid] == target) {
            if (mid == nums.size() - 1 || nums[mid + 1] != target) {
                //说明找到了最右边=target的下标
                return mid;
            } else {
                begin = mid + 1;
            }
        } else if (nums[mid] > target) {
            end = mid - 1;
        } else if (nums[mid] < target) {
            begin = mid + 1;
        }
    }
    return -1;
}

std::vector<int> Solution6::searchRange(std::vector<int>& nums, int target) {
    int left = left_bound(nums, target);
    int right = right_bound(nums, target);
    std::vector<int> result{ left, right };
    return result;
}

#pragma mark code-test
/*
 std::vector<int> a{2,3,4,4,4,7,7,8,10,10,11,12,13,14,15,15,17,18,19,23,24,24,24,24,25,26,26,26,27,27,28,29,29,30,33,36,38,38,40,40,41,43,43,43,44,46,46,47,51,52,52,53,54,56,57,57,57,58,58,61,61,61,62,64,64,66,66,67,67,67,70,72,74,74,74,75,75,78,78,78,79,79,80,83,83,83,83,84,84,86,88,89,89,90,91,91,92,93,93,96};
 int n = 100, v = 1;
 Solution6 solve;
 int bound = solve.upper_bound_(n, v, a);
 printf("%d\n", bound);
 */
