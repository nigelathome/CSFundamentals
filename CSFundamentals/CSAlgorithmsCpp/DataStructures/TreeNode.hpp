//
//  TreeNode.hpp
//  CSAlgorithmsCpp
//
//  Created by Hui,Li on 2020/12/2.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#ifndef TreeNode_hpp
#define TreeNode_hpp

#include <stdio.h>

struct TreeNode {
    int val;
    TreeNode *left;
    TreeNode *right;
    
    TreeNode(int _val);
};

#endif /* TreeNode_hpp */
