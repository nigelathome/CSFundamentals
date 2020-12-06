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

std::vector<std::vector<int> > Solution5::levelOrder(TreeNode* root) {
    std::vector<std::vector<int>> result;
    if (!root) {
        return result;
    }
    std::queue<std::pair<TreeNode *, int>> pair_queue;
    pair_queue.push(std::make_pair(root, 0));
    int current_layer = 0;
    std::vector<int> item;
    while (!pair_queue.empty()) {
        TreeNode *node = pair_queue.front().first;
        int layer = pair_queue.front().second;
        pair_queue.pop();
        if (layer == current_layer) {
            item.push_back(node->val);
        } else {
            current_layer = layer;
            result.push_back(item);
            item.clear();
            item.push_back(node->val);
        }
        if (node->left) {
            pair_queue.push(std::make_pair(node->left, layer+1));
        }
        if (node->right) {
            pair_queue.push(std::make_pair(node->right, layer+1));
        }
    }
    if (item.size() != 0) {
        result.push_back(item);
    }
    return result;
}

TreeNode *build_tree_node(std::vector<int>& preorder,
                         std::vector<int>& inorder,
                         int pre_left, int pre_right,
                         int in_left, int in_right) {
    if (pre_left > pre_right || in_left > in_right) {
        return NULL;
    }
    //根节点是前序序列中的第一个结点
    TreeNode *root = new TreeNode(preorder[pre_left]);
    
    //确定左右子树在前序序列和中序序列中的下标 进行递归
    int in_root = in_left;//找到中序序列中根节点下标
    while (in_root <= in_right
           && preorder[pre_left] != inorder[in_root]) {
            in_root++;
    }
    int left_len = in_root - in_left;//中序序列中左子树的长度
    
    //构造左子树
    TreeNode *left = build_tree_node(preorder, inorder,
                                     pre_left+1, pre_left + left_len,
                                     in_left, in_left+left_len-1);
    root->left = left;
    
    //构造右子树
    TreeNode *right = build_tree_node(preorder, inorder,
                                     pre_left + left_len + 1, pre_right,
                                     in_root + 1, in_right);
    root->right = right;
    
    return root;
}

TreeNode* Solution5::buildTree(std::vector<int>& preorder, std::vector<int>& inorder) {
    TreeNode *root = build_tree_node(preorder, inorder, 0, (int)preorder.size()-1, 0, (int)inorder.size()-1);
    return root;
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

/*
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

 */
