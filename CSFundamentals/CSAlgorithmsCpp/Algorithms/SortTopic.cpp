//
//  SortTopic.cpp
//  CSAlgorithmsCpp
//
//  Created by Hui,Li on 2020/12/2.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#include "SortTopic.hpp"

//合并两个有序数组
void merge_two_vec(std::vector<int> &sub_1, std::vector<int> &sub_2, std::vector<int> &vec) {
    int i=0, j=0;
    while (i<sub_1.size() && j<sub_2.size()) {
        if (sub_1[i] < sub_2[j]) {
            vec.push_back(sub_1[i]);
            i++;
        } else {
            vec.push_back(sub_2[j]);
            j++;
        }
    }
    if (i==sub_1.size()) {
        for(; j<sub_2.size(); j++){
            vec.push_back(sub_2[j]);
        }
    }
    if (j==sub_2.size()) {
        for (; i<sub_1.size(); i++) {
            vec.push_back(sub_1[i]);
        }
    }
}

void merge_sort(std::vector<int> &arr) {
    if (arr.size() == 1) {
        return;
    }
    int mid = (int)arr.size()/2;
    std::vector<int> sub1, sub2;
    for (int i=0; i<mid; i++) {
        sub1.push_back(arr[i]);
    }
    for (int j=mid; j<arr.size(); j++) {
        sub2.push_back(arr[j]);
    }
    merge_sort(sub1);
    merge_sort(sub2);
    arr.clear();
    merge_two_vec(sub1, sub2, arr);
}

std::vector<int> Solution4::MySort(std::vector<int>& arr) {
    merge_sort(arr);
    return arr;
}

#pragma mark code-test
/*
 Solution4 solve;
 std::vector<int> arr;
 arr.push_back(5);
 arr.push_back(3);
 arr.push_back(4);
 arr.push_back(1);
 arr.push_back(2);
 solve.MySort(arr);
 for (int i=0; i<arr.size(); i++) {
     printf("[%d]\n", arr[i]);
 }
 */
