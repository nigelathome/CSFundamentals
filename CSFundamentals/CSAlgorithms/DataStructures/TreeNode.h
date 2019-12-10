//
//  TreeNode.h
//  CSAlgorithms
//
//  Created by Hui,Li on 2019/12/3.
//  Copyright © 2019 Hui,Li. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TreeNode : NSObject

//左右子树
@property (nonatomic, nullable) TreeNode *left;
@property (nonatomic, nullable) TreeNode *right;

//结点
@property (nonatomic, assign) NSInteger val;

//比该节点小的节点个数, 即左子树节点的个数
@property (nonatomic, assign) NSInteger count;

- (instancetype)initWithValue:(NSInteger)val;

@end

//记录节点和所在层数
@interface TreeNodePair : NSObject

@property (nonatomic, nullable) TreeNode *node;
@property (nonatomic, assign) NSUInteger depth;

- (instancetype)initWithNode:(TreeNode *)node andDepth:(NSUInteger)depth;

@end

@interface BST : NSObject //BST二叉查找树 比根节点小的元素位于左子树, 大于或者等于根节点的元素位于右子树

//节点插入根节点是node的BST中
- (void)BST:(TreeNode *)root insert:(TreeNode *)node;

//BST中查找节点
- (BOOL)BST:(TreeNode *)root search:(TreeNode *)node;

@end

NS_ASSUME_NONNULL_END
