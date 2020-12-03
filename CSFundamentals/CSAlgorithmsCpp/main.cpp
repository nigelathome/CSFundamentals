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
    
    TreeNode a(5);
    TreeNode b(4);
    TreeNode c(8);
    TreeNode d(11);
    TreeNode e(13);
    TreeNode f(4);
    TreeNode g(7);
    TreeNode h(2);
    TreeNode i(5);
    TreeNode j(1);
    a.left = &b;
    a.right = &c;
    b.left = &d;
    b.right = &h;
    d.left = &g;
    d.right = &h;
    c.left = &e;
    c.right = &f;
    f.left = &i;
    f.right = &j;
    
    CommonUtil commonUtil;
    printf("前序遍历\n");
    commonUtil.preorder_binary_tree(&a, 0);
    printf("\n后序遍历\n");
    commonUtil.postorder_binary_tree(&a, 0);
    printf("\n中序遍历\n");
    commonUtil.inorder_binary_tree(&a, 0);
    
    Solution5 solve;
    std::vector<std::vector<int>> result = solve.pathSum(&a, 22);
    
    return 0;
}
