//
//  BinaryTreeTopic.cpp
//  CSAlgorithmsCpp
//
//  Created by Hui,Li on 2020/12/3.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#include "BinaryTreeTopic.hpp"

void path_sum(TreeNode *node, int total, int sum, std::vector<int> item, std::vector<std::vector<int>> &result) {
    if (!node) {
        return;
    }
    total += node->val;
    item.push_back(node->val);
    path_sum(node->left, total, sum, item, result);
    path_sum(node->right, total, sum, item, result);
    if (total == sum && !node->left && !node->right) {
        result.push_back(item);
    }
}

std::vector<std::vector<int>> Solution5::pathSum(TreeNode* root, int sum) {
    std::vector<std::vector<int>> result;
    std::vector<int> item;
    path_sum(root, 0, sum, item, result);
    return result;
}

/*
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
 */
