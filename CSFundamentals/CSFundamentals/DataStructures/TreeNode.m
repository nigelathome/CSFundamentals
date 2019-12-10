//
//  TreeNode.m
//  CSFundamentals
//
//  Created by Hui,Li on 2019/12/3.
//  Copyright © 2019 Hui,Li. All rights reserved.
//

#import "TreeNode.h"

@implementation TreeNode

- (instancetype)initWithValue:(NSInteger)val {
    if (self = [super init]) {
        self.val = val;
        self.left = nil;
        self.right = nil;
    }
    return self;
}

@end

@implementation TreeNodePair

- (instancetype)initWithNode:(TreeNode *)node andDepth:(NSUInteger)depth {
    self = [super init];
    if (self) {
        _node = node;
        _depth = depth;
    }
    return self;
}

@end

@implementation BST

- (void)insertNode:(TreeNode *)insertNode toNode:(TreeNode *)node {
    if (insertNode.val < node.val) {
        if (node.left) {
            [self insertNode:insertNode toNode:node.left];
        } else {
            node.left = insertNode;
        }
    } else {
        if (node.right) {
            [self insertNode:insertNode toNode:node.right];
        } else {
            node.right = insertNode;
        }
    }
}

- (BOOL)BST:(TreeNode *)root containNode:(TreeNode *)node {
    if (node.val == root.val) {
        return YES;
    } else if (node.val < root.val) { //在左子树中查找
        if (root.left) {
            return [self BST:root.left containNode:node];
        }
        
    } else { //在右子树中查找
        if (root.right) {
            return [self BST:root.right containNode:node];
        }
    }
    return NO;
}

@end
