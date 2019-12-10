//
//  TreeNode.h
//  CSFundamentals
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
//结点值
@property (nonatomic, assign) NSInteger val;

- (instancetype)initWithValue:(NSInteger)val;

@end

//记录节点和所在层数
@interface TreeNodePair : NSObject

@property (nonatomic, nullable) TreeNode *node;
@property (nonatomic, assign) NSUInteger depth;

- (instancetype)initWithNode:(TreeNode *)node andDepth:(NSUInteger)depth;

@end

@interface BST : NSObject //BST二叉查找树

//节点插入根节点是node的BST中
- (void)BST:(TreeNode *)root insert:(TreeNode *)node;

//BST是否包含节点节点
- (BOOL)BST:(TreeNode *)root search:(TreeNode *)node;

@end

NS_ASSUME_NONNULL_END
