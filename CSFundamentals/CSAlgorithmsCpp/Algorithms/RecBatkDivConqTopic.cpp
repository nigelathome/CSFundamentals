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

void generate_subset_duplicate_element(int i,
                                       std::vector<int> &nums,
                                       std::vector<int> &item,
                                       std::set<std::vector<int>> &item_set,
                                       std::vector<std::vector<int>> &result) {
    if (i>=nums.size()) {
        return;
    }
    item.push_back(nums[i]);
    if (item_set.find(item) == item_set.end()) {//不重复的集合则加入result
        result.push_back(item);
        item_set.insert(item);//set记录该元素
    }
    generate_subset_duplicate_element(i+1, nums, item, item_set, result);
    
    item.pop_back();
    generate_subset_duplicate_element(i+1, nums, item, item_set, result);
}

std::vector<std::vector<int>> Solution3::subsetsWithDup(std::vector<int>& nums) {
    std::vector<std::vector<int>> result;
    std::vector<int> item;
    std::set<std::vector<int>> item_set; //用来进行去重
    std::sort(nums.begin(), nums.end());//默认从小到大排序
    result.push_back(item);//加入空集
    generate_subset_duplicate_element(0, nums, item, item_set, result);
    return result;
}

void get_parenthesis(int n,
                     int left,
                     int right,
                     std::string item,
                     std::vector<std::string> &result) {
    if (left == n && right == n) {
        result.push_back(item);
        return;
    }
    
    //进行左括号的尝试
    if (left <= n) {
        item.append(1, '(');
        get_parenthesis(n, left+1, right, item, result);
        item.erase(item.size()-1);
    }
    //保证括号的合法性 左括号必须比右括号多的时候才能尝试左括号
    if (right < left && right <n) {
        //进行右括号的尝试
        item.append(1, ')');
        get_parenthesis(n, left, right+1, item, result);
    }
  
}

std::vector<std::string> Solution3::generateParenthesis(int n) {
    std::vector<std::string> result;
    std::string item;
    get_parenthesis(n, 0, 0, item, result);
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

/*
 std::vector<int> nums;
 nums.push_back(1);
 nums.push_back(2);
 nums.push_back(2);
 Solution3 solve;
 std::vector<std::vector<int>> result = solve.subsetsWithDup(nums);
 for (int i=0; i<result.size(); i++) {
     for (int j=0; j<result[i].size(); j++) {
         printf("%d", result[i][j]);
     }
     printf("\n");
 }
 */

