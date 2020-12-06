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
    
    std::vector<int> preorder, inorder;
    preorder.push_back(3);
    preorder.push_back(9);
    preorder.push_back(20);
    preorder.push_back(15);
    preorder.push_back(7);
    
    inorder.push_back(9);
    inorder.push_back(3);
    inorder.push_back(15);
    inorder.push_back(20);
    inorder.push_back(7);
    
    Solution5 solve;
    TreeNode *result = solve.buildTree(preorder, inorder);
    
    CommonUtil commonUtil;
    printf("前序遍历\n");
    commonUtil.preorder_binary_tree(result, 0);
    printf("\n中序遍历\n");
    commonUtil.inorder_binary_tree(result, 0);
    printf("\n层次遍历\n");
    commonUtil.print_tree_in_level(result, 0);

    return 0;
}
