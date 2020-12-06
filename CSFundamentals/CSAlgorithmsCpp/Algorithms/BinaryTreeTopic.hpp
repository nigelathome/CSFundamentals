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
};

#endif /* BinaryTreeTopic_hpp */
