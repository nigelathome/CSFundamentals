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
//    std::string data = "5,#,4,#,3,#,2";
    std::string data = "8,6,10,5,7,9,11";
    TreeNode *root = solve.deserializeBinaryTree(data);
    
    std::string serial_data = solve.serializeBinaryTree(root);
    
    CommonUtil commonUtil;
    commonUtil.preorder_binary_tree(root, 0);
    printf("原始序列：%s\n", data.c_str());
    printf("序列化二叉树：%s\n", serial_data.c_str());
        
    return 0;
}
