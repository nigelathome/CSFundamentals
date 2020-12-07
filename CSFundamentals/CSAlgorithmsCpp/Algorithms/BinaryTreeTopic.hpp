//
//  BinaryTreeTopic.hpp
//  CSAlgorithmsCpp
//
//  Created by Hui,Li on 2020/12/3.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#ifndef BinaryTreeTopic_hpp
#define BinaryTreeTopic_hpp

#include <stdio.h>

class Solution5 {
public:
    //113. 路径总和 II
    std::vector<std::vector<int>> pathSum(TreeNode* root, int sum);
    
    //236. 二叉树的最近公共祖先
    TreeNode* lowestCommonAncestor(TreeNode* root, TreeNode* p, TreeNode* q);
    
    //NC15 求二叉树的层序遍历
    std::vector<std::vector<int> > levelOrder(TreeNode* root);
    
    //105. 从前序与中序遍历序列构造二叉树
    TreeNode* buildTree(std::vector<int>& preorder, std::vector<int>& inorder);
    
    //199. 二叉树的右视图
    std::vector<int> rightSideView(TreeNode* root);
    
    //NC5 二叉树根节点到叶子节点的所有路径和
    int sumNumbers(TreeNode* root);
    
    //449. 序列化和反序列化二叉搜索树
    std::string serialize(TreeNode* root);
    TreeNode* deserialize(std::string data);
    
    //297. 二叉树的序列化与反序列化
    std::string serializeBinaryTree(TreeNode* root);
    TreeNode* deserializeBinaryTree(std::string data);
};

#endif /* BinaryTreeTopic_hpp */
