//
//  BTreeGraphicTopics.m
//  CSFundamentals
//
//  Created by Hui,Li on 2019/12/3.
//  Copyright © 2019 Hui,Li. All rights reserved.
//

#import "BTreeGraphicTopics.h"
#import "TreeNode.h"

@implementation BTreeGraphicTopics

- (void)preorderPrint:(TreeNode *)node layer:(NSUInteger)layer {
    if (!node) {
        return;
    }
    for (NSUInteger i = 0; i < 3 * layer; i++) {
        printf("-------"); //不同的------表示不同层
    }
    printf("[%ld]\n", node.val);
    [self preorderPrint:node.left layer:layer + 1];
    [self preorderPrint:node.right layer:layer + 1];
}

- (void)inorderPrint:(TreeNode *)node layer:(NSUInteger)layer {
    if (!node) {
        return;
    }
    [self inorderPrint:node.left layer:layer + 1];
    for (NSUInteger i = 0; i < 3 * layer; i++) {
        printf("-------");
    }
    printf("[%ld]\n", node.val);
    [self inorderPrint:node.right layer:layer + 1];
}

- (void)postorderPrint:(TreeNode *)node layer:(NSUInteger)layer {
    if (!node) {
        return;
    }
    [self postorderPrint:node.left layer:layer + 1];
    [self postorderPrint:node.right layer:layer + 1];
    for (NSUInteger i = 0; i < 3 * layer; i++) {
        printf("-------");
    }
    printf("[%ld]\n", node.val);
}

- (NSMutableArray<NSMutableArray<TreeNode *> *> *)pathSum:(TreeNode *)node sum:(NSInteger)sum {
    NSMutableArray<NSMutableArray<TreeNode *> *> *result = [[NSMutableArray alloc] init];
    NSMutableArray<TreeNode *> *path = [[NSMutableArray alloc] init];
    NSNumber *currentSum = [NSNumber numberWithInteger:0];
    [self findPath:path fromNode:node currentSum:currentSum targetSum:sum result:result];
    return result;
}

- (void)findPath:(NSMutableArray<TreeNode *> *)path
        fromNode:(TreeNode *)node
      currentSum:(NSNumber *)currentSum
       targetSum:(NSInteger)sum
          result:(NSMutableArray<NSMutableArray<TreeNode *> *> *)result {
    if (!node) {
        return;
    }
    [path addObject:node];
    currentSum = [NSNumber numberWithInteger:[currentSum integerValue] + node.val];
    if (!node.left && !node.right && [currentSum integerValue] == sum) { //当前节点是叶子节点并且累加和等于sum
        NSMutableArray<TreeNode *> *currentPath = (NSMutableArray<TreeNode *> *)[NSMutableArray arrayWithArray:path];
        [result addObject:currentPath];
    }
    [self findPath:path fromNode:node.left currentSum:currentSum targetSum:sum result:result];
    [self findPath:path fromNode:node.right currentSum:currentSum targetSum:sum result:result];
    //遍历完当前节点的左右子树之后, 该节点出栈, 且更新currentSum的值
    currentSum = [NSNumber numberWithInteger:[currentSum integerValue] - node.val];
    [path removeLastObject];
}

- (NSMutableArray<NSMutableArray<TreeNode *> *> *)findAllPathsFromNode:(TreeNode *)node {
    NSMutableArray<NSMutableArray<TreeNode *> *> *allPaths = [[NSMutableArray alloc] init];
    NSMutableArray<TreeNode *> *path = [[NSMutableArray alloc] init];
    [self findPath:path fromTree:node result:allPaths];
    return allPaths;
}

- (void)findPath:(NSMutableArray<TreeNode *> *)possiblePath
        fromTree:(TreeNode *)node
          result:(NSMutableArray<NSMutableArray<TreeNode *> *> *)result {
    if (!node) {
        return;
    }
    [possiblePath addObject:node];
    if (!node.left && !node.right) {
        NSMutableArray<TreeNode *> *path = (NSMutableArray<TreeNode *> *)[NSMutableArray arrayWithArray:possiblePath];
        [result addObject:path];
    }
    [self findPath:possiblePath fromTree:node.left result:result];
    [self findPath:possiblePath fromTree:node.right result:result];
    [possiblePath removeLastObject]; //当访问完该结点的左右子树后, 当前的node出栈
}

#pragma mark test-code
/*
 //找根节点到叶节点的全部路径
 NSMutableArray<NSMutableArray<TreeNode *> *> *allPaths = [bTreeGraphicTopics findAllPathsFromNode:a];
 printf("全部路径:\n");
 [allPaths enumerateObjectsUsingBlock:^(NSMutableArray<TreeNode *> * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
 [obj enumerateObjectsUsingBlock:^(TreeNode * _Nonnull treeNode, NSUInteger idx, BOOL * _Nonnull stop) {
 printf("[%ld]", (long)treeNode.val);
 }];
 printf("\n");
 }];
 */

@end
