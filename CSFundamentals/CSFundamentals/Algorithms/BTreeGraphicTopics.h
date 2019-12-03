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

@end

NS_ASSUME_NONNULL_END
