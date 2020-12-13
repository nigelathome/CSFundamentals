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

int Solution6::search(std::vector<int>& nums, int target) {
    int begin = 0, end = (int)nums.size() - 1;
    int mid = 0;
    while (begin <= end) {
        mid = (begin + end) / 2;
        if (nums[mid] == target) {
            return mid;
        } else if (nums[mid] > target) {
            //判断哪个是有序区间哪个是旋转区间
            if (nums[begin] < nums[mid]) {//左区间是有序区间
                if (target < nums[begin]) {
                    begin = mid + 1;
                } else {
                    end = mid - 1;
                }
            } else if (nums[begin] > nums[mid]) {//左区间是旋转区间
                end = mid - 1;
            } else if (nums[begin] == nums[mid]) {//只有1个或者两个元素的情形begin=mid
                begin = mid + 1;
            }
        } else if (nums[mid] < target) {
            //判断哪个是有序区间哪个是旋转区间
            if (nums[begin] < nums[mid]) {//左区间是有序区间
                begin = mid + 1;
            } else if (nums[begin] > nums[mid]) {//左区间是旋转区间
                if (target>nums[begin]) {
                    end = mid - 1;
                } else {
                    begin = mid + 1;
                }
            } else if (nums[begin] == nums[mid]) {
                begin = mid + 1;
            }
        }
    }
    return -1;
}

bool Solution6::findNumberIn2DArray(std::vector<std::vector<int>>& matrix, int target) {
    //从第一行最后一列开始找(右上角, 也可以从左下角元素开始) 如果相等返回 如果大于target减少一行 如果小于target减少一列
    if (matrix.size() == 0) {
        return false;
    }
    int rows = (int)matrix.size()-1;
    int cols = (int)matrix[0].size()-1;
    int i = 0, j = cols;
    while (i <= rows && j >= 0) {
        if (target == matrix[i][j]) {
            return true;
        } else if (target > matrix[i][j]) {
            i++;//抛弃当前第i行
        } else if (target < matrix[i][j]) {
            j--;//抛弃第j列
        }
    }
    return false;
}

int Solution6::findMin(std::vector<int>& nums) {
    if (nums.size()==0) {
        return -1;
    }
    //数组如果没有旋转过 那么第一个元素一定小于最后一个元素 最小元素就是第一个元素
    if (nums[0] < nums[nums.size()-1]) {
        return nums[0];
    }
    //旋转后的数组 对于临界位置左边和右边的数组都是单调递增的 找到两个临界元素他们构成单调递减 那么后一个元素就是要找的最小元素
    int begin = 0, end = (int)nums.size()-1;
    while(nums[begin]==nums[end] && end >0) {
        end--;
    }
    int mid = 0;
    while (begin<end && end-begin>1) {
        mid = (begin + end)/2;
        if (nums[mid]<nums[begin]) {//begin-mid存在临界点 二分begin-mid区间
            end = mid;
        } else {//begin-mid有序不存在临界点 二分mid-end区间
            begin = mid;
        }
    }
    return nums[end];
}

#pragma mark code-test
/*
 std::vector<int> a{2,3,4,4,4,7,7,8,10,10,11,12,13,14,15,15,17,18,19,23,24,24,24,24,25,26,26,26,27,27,28,29,29,30,33,36,38,38,40,40,41,43,43,43,44,46,46,47,51,52,52,53,54,56,57,57,57,58,58,61,61,61,62,64,64,66,66,67,67,67,70,72,74,74,74,75,75,78,78,78,79,79,80,83,83,83,83,84,84,86,88,89,89,90,91,91,92,93,93,96};
 int n = 100, v = 1;
 Solution6 solve;
 int bound = solve.upper_bound_(n, v, a);
 printf("%d\n", bound);
 */

/*
 std::vector<int> nums = {9, 12, 15, 20, 1, 3, 6, 7};
 Solution6 solve;
 for(int i=0; i<22; i++) {
     int result = solve.search(nums, i);
     printf("target=%d, index=%d\n", i, result);
 }
 */

/*
 std::vector<std::vector<int>> matrix = {{1, 4, 7, 11, 15}, {2, 5, 8, 12, 19}, {3, 6, 9, 16, 22}, {10, 13, 14, 17, 24}, {18, 21, 23, 26, 30}
 };
 Solution6 solve;
 int target = 20;
 bool find = solve.findNumberIn2DArray(matrix, target);
 std::cout << std::boolalpha << find << endl;
 */
