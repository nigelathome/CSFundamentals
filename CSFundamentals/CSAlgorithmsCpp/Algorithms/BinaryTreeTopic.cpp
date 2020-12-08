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

std::vector<int> Solution5::rightSideView(TreeNode* root) {
    std::vector<int> result;
    if (!root) {
        return result;
    }
    std::queue<std::pair<TreeNode *, int>> queue;
    queue.push(std::make_pair(root, 0));
    int cur_layer = 0;
    TreeNode *last_node = root;
    while (!queue.empty()) {
        TreeNode *node = queue.front().first;
        int layer = queue.front().second;
        queue.pop();
        if (cur_layer != layer) {
            result.push_back(last_node->val);
            cur_layer = layer;
        }
        last_node = node;
        if (node->left) {
            queue.push(std::make_pair(node->left, layer+1));
        }
        if (node->right) {
            queue.push(std::make_pair(node->right, layer+1));
        }
    }
    result.push_back(last_node->val);
    return result;
}

void get_path(TreeNode *node,
              std::vector<int> &item,
              std::vector<std::vector<int>> &result) {
    if (!node) {
        return;
    }
    item.push_back(node->val);
    if (!node->left && !node->right) {//叶子节点则存入result
        result.push_back(item);
    }
    if (node->left) {
        get_path(node->left, item, result);
    }
    if (node->right) {
        get_path(node->right, item, result);
    }
    item.pop_back();
}

int Solution5::sumNumbers(TreeNode* root) {
    int sum = 0;
    if (!root) {
        return 0;
    }
    std::vector<int> item;
    std::vector<std::vector<int>> paths;
    get_path(root, item, paths);
    for (int i=0; i<paths.size(); i++) {
        int num = 0;
        for (int j=0; j<paths[i].size(); j++) {
            num = num * 10 + paths[i][j];
        }
        sum += num;
    }
    
    return sum;
}

//把整数转成字符串
std::string int_to_string(int val) {
    std::string result;
    while (val) {
        result += val % 10 + '0';
        val = val / 10;
    }
    std::reverse(result.begin(), result.end());
    result += '#';
    return result;
}

void preorder_BST(TreeNode *root, std::string &result) {
    if (!root) {
        return;
    }
    std::string val_string = int_to_string(root->val);
    result += val_string;
    preorder_BST(root->left, result);
    preorder_BST(root->right, result);
}

std::string Solution5::serialize(TreeNode* root) {
    //依次取出节点的val转成字符串 通过#区分不同的值
    //BST性质：BST的前序序列与序列再生成一颗BST是完全一样的 从而可以基于BST的先序遍历做编码和解码
    std::string result;
    preorder_BST(root, result);
    return result;
}

//把字符串解析成整数并保存
std::vector<int> string_to_int(std::string data_string) {
    std::vector<int> result;
    int val = 0;
    for (int i=0; i<data_string.size(); i++) {
        if (data_string[i] == '#') {
            result.push_back(val);
            val = 0;
        } else {
            val = val * 10 + data_string[i] - '0';
        }
    }
    return result;
}

void BST_insert(TreeNode *node, int value) {
    if (value < node->val) {
        if (node->left) {
            BST_insert(node->left, value);
        } else {
            TreeNode *left = new TreeNode(value);
            node->left = left;
        }
    } else {
        if (node->right) {
            BST_insert(node->right, value);
        } else {
            TreeNode *right = new TreeNode(value);
            node->right = right;
        }
    }
}

TreeNode* Solution5::deserialize(std::string data) {
    //将data中的数值解析成vec保存 通过vec构建BST
    std::vector<int> data_vec = string_to_int(data);
    if(data.size()==0)return NULL;
    TreeNode *root = new TreeNode(data_vec[0]);
    for (int i=1; i<data_vec.size(); i++) {
        BST_insert(root, data_vec[i]);
    }
    return root;
}

void preorder_tree_for_string(TreeNode *node, std::string &data) {
    if (!node) {
        data += "#,";
        return;
    }
    std::string val_string = std::to_string(node->val);
    data += val_string;
    data += ",";
    preorder_tree_for_string(node->left, data);
    preorder_tree_for_string(node->right, data);
}

std::string Solution5::serializeBinaryTree(TreeNode* root) {
    std::string result;
    if (!root) {
        return result;
    }
    preorder_tree_for_string(root, result);
    return result;
}

TreeNode *build_tree(std::queue<std::string> &queue) {
    //根据队列中的元素构造二叉树
    if (queue.empty()) {
        return NULL;
    }
    if(queue.front() == "#") {//#表示为空
        queue.pop();
        return NULL;
    }
    TreeNode *node = new TreeNode(atoi(queue.front().c_str()));//使用atoi把字符串转成int
    queue.pop();
    TreeNode *left = build_tree(queue);
    TreeNode *right = build_tree(queue);
    node->left = left;
    node->right = right;
    return node;
}

TreeNode* Solution5::deserializeBinaryTree(std::string data) {
    if (data.size() == 0) {
        return NULL;
    }
    std::stringstream data_stream(data);
    std::queue<std::string> data_queue;
    std::string tmp;
    while (getline(data_stream, tmp, ',')) {//按逗号分割字符串
        data_queue.push(tmp);
    }
    TreeNode *root = build_tree(data_queue);
    return root;
}

#pragma mark code-test
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

/*
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
 */

/*
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
 */

/*
 TreeNode a(1);
 TreeNode b(2);
 TreeNode c(3);
 a.left = &b;
 a.right = &c;
 
 Solution5 solve;
 int result = solve.sumNumbers(&a);
 printf("%d\n", result);
 */

/*
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
 */

/*
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
 */
