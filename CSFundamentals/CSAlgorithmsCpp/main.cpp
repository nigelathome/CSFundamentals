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
    
    TreeNode a(8);
    TreeNode b(3);
    TreeNode d(1);
    TreeNode e(6);
    TreeNode c(10);
    TreeNode f(15);
    a.left = &b;
    a.right = &c;
    b.left = &d;
    b.right = &e;
    c.right = &f;
    
    Solution5 solve;
    std::string result = solve.serialize(&a);
    printf("编码序列：%s\n", result.c_str());
    
    TreeNode *root = solve.deserialize(result);
    CommonUtil commonUtil;
    commonUtil.preorder_binary_tree(root, 0);
        
    return 0;
}
