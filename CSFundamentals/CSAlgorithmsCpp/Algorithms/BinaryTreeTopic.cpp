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

//获取从根结点到指定p结点的路径
void get_target_path(TreeNode *node,
                     TreeNode *p,
                     std::vector<TreeNode *> item,
                     std::vector<TreeNode *> &result,
                     bool &finish) {
    if (!node || finish) {
        return;
    }
    item.push_back(node);
    if (node == p) {
        result = item;
        return;
    }
    get_target_path(node->left, p, item, result, finish);
    get_target_path(node->right, p, item, result, finish);
}

TreeNode* Solution5::lowestCommonAncestor(TreeNode* root, TreeNode* p, TreeNode* q) {
    //分别找出root到p root到q的路径存到vector中 再比较vector求出最近的公共结点
    std::vector<TreeNode *> item;
    std::vector<TreeNode *> p_path, q_path;
    bool finish = false;
    get_target_path(root, p, item, p_path, finish);
//    CommonUtil commonUtil;
//    commonUtil.print_tree_vec(p_path);
    
    item.clear();
    finish = false;
    get_target_path(root, q, item, q_path, finish);
//    commonUtil.print_tree_vec(q_path);
    
    //求最近的公共结点
    int i = 0;
    if (p_path.size()==0 || q_path.size()==0) {
        return NULL;
    }
    while (p_path[i] == q_path[i]) {
        i++;
    }
    return p_path[i-1];
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

/*
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
 */

/*
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
 
 CommonUtil commonUtil;
 printf("前序遍历\n");
 commonUtil.preorder_binary_tree(&a, 0);
 
 Solution5 solve;
 TreeNode *result = solve.lowestCommonAncestor(&a, &b, &f);
 printf("ancestor:%d\n", result->val);
 result = solve.lowestCommonAncestor(&a, &d, &z);
 printf("ancestor:%d\n", result->val);
 result = solve.lowestCommonAncestor(&a, &b, &c);
 printf("ancestor:%d\n", result->val);
 */
