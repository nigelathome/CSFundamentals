//
//  BTreeGraphicTopics.h
//  CSFundamentals
//
//  Created by Hui,Li on 2019/12/3.
//  Copyright © 2019 Hui,Li. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class TreeNode;
@class GraphNode;

@interface BTreeGraphicTopics : NSObject

//前序打印二叉树
- (void)preorderPrint:(TreeNode *)node layer:(NSUInteger)layer;

//中序打印二叉树
- (void)inorderPrint:(TreeNode *)node layer:(NSUInteger)layer;

//后序打印二叉树
- (void)postorderPrint:(TreeNode *)node layer:(NSUInteger)layer;

//找根节点到叶节点的路径, 使得路径结点的值的和是sum (113)
- (NSMutableArray<NSMutableArray<TreeNode *> *> *)pathSum:(TreeNode *)root sum:(NSInteger)sum;

//找根节点到叶节点的全部路径
- (NSMutableArray<NSMutableArray<TreeNode *> *> *)findAllPathsFromNode:(TreeNode *)node;

//找根节点到某个节点的路径
- (NSMutableArray<TreeNode *> *)findPathFromRoot:(TreeNode *)root toNode:(TreeNode *)node;

//最低公共祖先 (236)
- (TreeNode *)lowestCommonAncestor:(TreeNode *)root node1:(TreeNode *)node1 node2:(TreeNode *)node2;

//将二叉树转化成单链表, left=nil, right指向下个节点, 单链表节点顺序是前序遍历的顺序 (114) 就地转换
- (void)flattenTree:(TreeNode *)root;

//将二叉树转化成单链表, left=nil, right指向下个节点, 单链表节点顺序是前序遍历的顺序 (114) 非就地转换
- (void)flattenTreeNotInPlace:(TreeNode *)root;

//层次打印二叉树
- (void)BFSTreePrint:(TreeNode *)root;

//侧面观察二叉树 (199)
- (NSMutableArray<NSNumber *> *)rightSideView:(TreeNode *)root;

//深度遍历有向图
- (void)DFSGraph:(NSArray<GraphNode *> *)graph;
- (void)DFSGraphPrint:(GraphNode *)node;

@end

//记录节点和所在层数
@interface TreeNodePair : NSObject

@property (nonatomic, nullable) TreeNode *node;
@property (nonatomic, assign) NSUInteger depth;

- (instancetype)initWithNode:(TreeNode *)node andDepth:(NSUInteger)depth;

@end

NS_ASSUME_NONNULL_END
