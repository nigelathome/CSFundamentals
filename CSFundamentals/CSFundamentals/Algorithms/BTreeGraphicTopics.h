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

@interface BTreeGraphicTopics : NSObject

//前序打印二叉树
- (void)preorderPrint:(TreeNode *)node layer:(NSUInteger)layer;

//中序打印二叉树
- (void)inorderPrint:(TreeNode *)node layer:(NSUInteger)layer;

//后序打印二叉树
- (void)postorderPrint:(TreeNode *)node layer:(NSUInteger)layer;

//找根节点到叶节点的路径, 使得路径结点的值的和是sum (113)
- (NSMutableArray<NSMutableArray<NSNumber *> *> *)pathSum:(TreeNode *)root sum:(NSInteger)sum;

//找根节点到叶节点的全部路径
- (NSMutableArray<NSMutableArray<TreeNode *> *> *)findAllPathsFromNode:(TreeNode *)node;

@end

NS_ASSUME_NONNULL_END
