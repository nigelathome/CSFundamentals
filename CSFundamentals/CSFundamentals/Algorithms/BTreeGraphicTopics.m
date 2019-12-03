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

- (NSMutableArray<NSMutableArray<NSNumber *> *> *)pathSum:(TreeNode *)root sum:(NSInteger)sum {
    NSMutableArray<NSMutableArray<NSNumber *> *> *result = [[NSMutableArray alloc] init];
    
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
    if ([currentSum integerValue] == sum) {
        [result addObject:path];
    }
    [path addObject:node];
    currentSum = [NSNumber numberWithInteger:[currentSum integerValue] + node.val];
    [self findPath:path fromNode:node.left currentSum:currentSum targetSum:sum result:result];
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
    [possiblePath removeLastObject];
}


@end
