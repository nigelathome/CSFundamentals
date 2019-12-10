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
        self.count = 0;
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

- (void)BST:(TreeNode *)root insert:(TreeNode *)node {
    if (node.val < root.val) {
        if (root.left) {
            [self BST:root.left insert:node];
        } else {
            root.left = node;
        }
    } else {
        if (root.right) {
            [self BST:root.right insert:node];
        } else {
            root.right = node;
        }
    }
}

- (BOOL)BST:(TreeNode *)root search:(TreeNode *)node {
    if (node.val == root.val) {
        return YES;
    } else if (node.val < root.val) { //在左子树中查找
        if (root.left) {
            return [self BST:root.left search:node];
        }
        
    } else { //在右子树中查找
        if (root.right) {
            return [self BST:root.right search:node];
        }
    }
    return NO;
}

@end
