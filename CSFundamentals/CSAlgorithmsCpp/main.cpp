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
    
    TreeNode a(3);
    TreeNode b(9);
    TreeNode c(20);
    TreeNode d(15);
    TreeNode e(7);
    
    a.left = &b;
    a.right = &c;
    b.left = &d;
    b.right = &e;
    
    CommonUtil commonUtil;
    printf("前序遍历\n");
    commonUtil.preorder_binary_tree(&a, 0);
    printf("层次遍历\n");
    commonUtil.print_tree_in_level(&a, 0);
    
    Solution5 solve;
    std::vector<std::vector<int>> result = solve.levelOrder(&a);
    
    std::vector<int> vec;
    vec.push_back(9);
    vec.push_back(10);
    vec.push_back(11);
    vec.push_back(12);
    std::reverse(vec.begin(), vec.end());

    return 0;
}
