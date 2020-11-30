//
//  RecBatkDivConqTopic.cpp
//  CSAlgorithmsCpp
//
//  Created by Hui,Li on 2020/11/28.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#include "RecBatkDivConqTopic.hpp"

void generate_subset(int i, std::vector<int> nums,
                     std::vector<int> &item,
                     std::vector<std::vector<int>> &result) {
    if (i>=nums.size()) {
        return;
    }
    //加入该元素情况下进行尝试
    item.push_back(nums[i]);
    result.push_back(item);
    generate_subset(i+1, nums, item, result);
    
    //不加入该元素情况下进行尝试
    item.pop_back();
    generate_subset(i+1, nums, item, result);
}

std::vector<std::vector<int>> Solution3::subsets(std::vector<int>& nums) {
    std::vector<std::vector<int>> result;
    std::vector<int> item;
    //加入空集
    result.push_back(item);
    generate_subset(0, nums, item, result);
    return result;
}

/*
 void calculate(int n, int &sum) {
     if (n==0) {
         return;
     }
     sum += n;
     calculate(n-1, sum);
 }

 int sum = 0;
 calculate(20, sum);
 printf("%d\n", sum);
 */

/*
 void add_to_vector(ListNode *head, std::vector<int> &vec) {
     if (!head) {
         return;
     }
     vec.push_back(head->val);
     add_to_vector(head->next, vec);
 }
 
 ListNode a(1);
 ListNode b(2);
 ListNode c(3);
 ListNode d(4);
 ListNode e(5);
 a.next = &b;
 b.next = &c;
 c.next = &d;
 d.next = &e;
 std::vector<int> vec;
 add_to_vector(&a, vec);
 for (int i=0; i<vec.size(); i++) {
     printf("%d\n", vec[i]);
 }
 */

