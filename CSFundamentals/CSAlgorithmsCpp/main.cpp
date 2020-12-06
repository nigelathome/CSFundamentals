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
    TreeNode c(3);
    TreeNode d(4);
    TreeNode e(5);
    a.left = &b;
    a.right = &c;
    b.right = &e;
    c.right = &d;
    
    CommonUtil commonUtil;
    printf("前序遍历\n");
    commonUtil.preorder_binary_tree(&a, 0);
    printf("\n中序遍历\n");
    commonUtil.inorder_binary_tree(&a, 0);
    printf("\n层次遍历\n");
    commonUtil.print_tree_in_level(&a, 0);
    
    Solution5 solve;
    std::vector<int> result = solve.rightSideView(&a);
        

    return 0;
}
