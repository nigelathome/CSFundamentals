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
    
    TreeNode a(1);
    TreeNode b(2);
    TreeNode d(3);
    TreeNode e(4);
    TreeNode c(5);
    TreeNode f(6);
    a.left = &b;
    a.right = &c;
    b.left = &d;
    b.right = &e;
    c.right = &f;
    
    CommonUtil commonUtil;
    printf("前序遍历\n");
    commonUtil.preorder_binary_tree(&a, 0);
    printf("\n后序遍历\n");
    commonUtil.postorder_binary_tree(&a, 0);
    printf("\n中序遍历\n");
    commonUtil.inorder_binary_tree(&a, 0);
    
    return 0;
}
