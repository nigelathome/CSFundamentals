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
    TreeNode b(5);
    TreeNode c(1);
    TreeNode d(6);
    TreeNode e(2);
    TreeNode f(0);
    TreeNode x(8);
    TreeNode y(7);
    TreeNode z(4);
    
    a.left = &b;
    a.right = &c;
    b.left = &d;
    b.right = &e;
    c.left = &f;
    c.right = &x;
    e.left = &y;
    e.right = &z;
    
//    CommonUtil commonUtil;
//    printf("前序遍历\n");
//    commonUtil.preorder_binary_tree(&a, 0);
    
    Solution5 solve;
    TreeNode *result = solve.lowestCommonAncestor(&a, &b, &f);
    printf("ancestor:%d\n", result->val);
    result = solve.lowestCommonAncestor(&a, &d, &z);
    printf("ancestor:%d\n", result->val);
    result = solve.lowestCommonAncestor(&a, &b, &y);
    printf("ancestor:%d\n", result->val);
    
    return 0;
}
