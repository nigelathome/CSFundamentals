//
//  BTreeGraphicTopics.m
//  CSFundamentals
//
//  Created by Hui,Li on 2019/12/3.
//  Copyright © 2019 Hui,Li. All rights reserved.
//

#import "BTreeGraphicTopics.h"
#import "TreeNode.h"
#import "Queue.h"
#import "GraphNode.h"

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
    //当前节点压栈, 和进行累加
    [path addObject:node];
    currentSum = [NSNumber numberWithInteger:[currentSum integerValue] + node.val];
    if (!node.left && !node.right && [currentSum integerValue] == sum) { //当前节点是叶子节点并且累加和等于sum
        NSMutableArray<TreeNode *> *currentPath = (NSMutableArray<TreeNode *> *)[NSMutableArray arrayWithArray:path];
        [result addObject:currentPath];
    }
    [self findPath:path fromNode:node.left currentSum:currentSum targetSum:sum result:result];
    [self findPath:path fromNode:node.right currentSum:currentSum targetSum:sum result:result];
    //遍历完当前节点的左右子树之后, 该节点出栈, 且更新currentSum的值
    [path removeLastObject];
    currentSum = [NSNumber numberWithInteger:[currentSum integerValue] - node.val];
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

- (NSMutableArray<TreeNode *> *)findPathFromRoot:(TreeNode *)root toNode:(TreeNode *)node {
    NSMutableArray<TreeNode *> *result = [[NSMutableArray alloc] init];
    NSMutableArray<TreeNode *> *currentPath = [[NSMutableArray alloc] init];
    NSNumber *isCompleted = [NSNumber numberWithBool:NO];
    [self findPathFromNode:root toNode:node currentPath:currentPath isCompleted:isCompleted result:result];
    return result;
}

- (void)findPathFromNode:(TreeNode *)node1
                  toNode:(TreeNode *)node2
             currentPath:(NSMutableArray<TreeNode *> *)currentPath
             isCompleted:(NSNumber *)isCompleted
                  result:(NSMutableArray<TreeNode *> *)result {
    if (!node1 || [isCompleted boolValue]) {
        return;
    }
    [currentPath addObject:node1];
    if (node1 == node2) {
        for (TreeNode *node in currentPath) {
            [result addObject:node];
        }
        isCompleted = [NSNumber numberWithBool:YES];
        return;
    }
    [self findPathFromNode:node1.left toNode:node2 currentPath:currentPath isCompleted:isCompleted result:result];
    [self findPathFromNode:node1.right toNode:node2 currentPath:currentPath isCompleted:isCompleted result:result];
    [currentPath removeLastObject];
}

- (TreeNode *)lowestCommonAncestor:(TreeNode *)root node1:(TreeNode *)node1 node2:(TreeNode *)node2 {
    NSMutableArray<TreeNode *> *node1Path = [self findPathFromRoot:root toNode:node1];
    NSMutableArray<TreeNode *> *node2Path = [self findPathFromRoot:root toNode:node2];
    NSUInteger shortLenght = ([node1Path count] < [node2Path count]) ? [node1Path count] : [node2Path count];
    TreeNode *result;
    for (NSUInteger i = 0; i < shortLenght; i++) {
        if (node1Path[i] == node2Path[i]) {//找最后一个相等的元素
            result = node1Path[i];
        }
    }
    return result;
}

- (void)flattenTreeNotInPlace:(TreeNode *)root {
    NSMutableArray<TreeNode *> *treeNodeArray = (NSMutableArray<TreeNode *> *)[[NSMutableArray alloc] init];
    [self buildTreeNodeArray:root treeNodeArray:treeNodeArray];
    for (NSUInteger i = 1; i < [treeNodeArray count]; i++) { //处理前n-1个节点
        treeNodeArray[i-1].left = nil;
        treeNodeArray[i-1].right = treeNodeArray[i];
    }
    treeNodeArray.lastObject.left = nil; //处理最后一个节点
    treeNodeArray.lastObject.right = nil;
    root = treeNodeArray.firstObject;
}

- (void)buildTreeNodeArray:(TreeNode *)root treeNodeArray:(NSMutableArray<TreeNode *> *)treeNodeArray {
    if (!root) {
        return;
    }
    [treeNodeArray addObject:root];
    [self buildTreeNodeArray:root.left treeNodeArray:treeNodeArray];
    [self buildTreeNodeArray:root.right treeNodeArray:treeNodeArray];
}

- (void)flattenTree:(TreeNode *)root {
    TreeNode *last = [[TreeNode alloc] init];
    [self flattenTree:root lastNode:&last];
}

- (void)flattenTree:(TreeNode *)root lastNode:(TreeNode **)last {
    //递归规律: root.left=nil, root.right=左子树根节点, 左子树的last节点指向root的右子树的根节点
    if (!root) {
        return;
    }
    if (!root.left && !root.right) { //叶子节点的last
        *last = root;
    }
    TreeNode *left = root.left, *right = root.right; //保存左右子树的根节点
    TreeNode *leftLast, *rightLast; //记录左右子树的last节点
    if (left) {
        [self flattenTree:left lastNode:&leftLast];
        root.left = nil; root.right = left;
        *last = leftLast; //如果有左子树last更新为左子树的最后一个节点
    }
    if (right) {
        [self flattenTree:right lastNode:&rightLast];
        if (leftLast) { //左子树的最后一个节点不空, 那么它的right指向右子树的根节点
            leftLast.right = right;
        }
        *last = rightLast; //如果有右子树, last更新为右子树的最后一个节点
    }
}

- (void)BFSTreePrint:(TreeNode *)root {
    if (!root) {
        return;
    }
    Queue *q = [[Queue alloc] init];
    [q push:root];
    while (![q empty]) {
        TreeNode *node = (TreeNode *)[q front];
        [q pop];
        printf("[%ld]", node.val);
        if (node.left) {
            [q push:node.left];
        }
        if (node.right) {
            [q push:node.right];
        }
    }
    printf("\n");
}

- (NSMutableArray<NSNumber *> *)rightSideView:(TreeNode *)root {
    if (!root) {
        return nil;
    }
    NSMutableArray<NSNumber *> *result = [[NSMutableArray alloc] init];
    Queue *q = [[Queue alloc] init];
    TreeNodePair *treeNodePair = [[TreeNodePair alloc] initWithNode:root andDepth:0];
    [q push:treeNodePair];
    while (![q empty]) {
        TreeNodePair *current = (TreeNodePair *)[q front];
        [q pop];
        NSUInteger depth = current.depth;
        NSUInteger value = current.node.val;
        //通过result的个数判断每层的最后一个节点
        if ([result count] <= depth) {
            [result addObject:[NSNumber numberWithInteger:current.node.val]];
        } else {
            result[depth] = [NSNumber numberWithInteger:current.node.val]; //更新result[depth]的值为当前节点
        }
        if (current.node.left) {
            TreeNodePair *leftPair = [[TreeNodePair alloc] initWithNode:current.node.left andDepth:depth + 1];
            [q push:leftPair];

        }
        if (current.node.right) {
            TreeNodePair *rightPair = [[TreeNodePair alloc] initWithNode:current.node.right andDepth:depth + 1];
            [q push:rightPair];
        }
    }
    return result;
}

- (void)DFSGraph:(NSArray<GraphNode *> *)graph {
    if (!graph) {
        return;
    }
    for (NSUInteger i = 0; i < [graph count]; i++) {
        if (!graph[i].isVisited) {
            printf("From vertex %ld: ", i);
            [self DFSGraphPrint:graph[i]];
            printf("\n");
        }
    }
    printf("\n");
}

- (void)DFSGraphPrint:(GraphNode *)node {
    if (!node && node.isVisited) {
        return;
    }
    node.isVisited = YES;
    printf("[%ld]", node.val);
    [node.neighbors enumerateObjectsUsingBlock:^(GraphNode * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (!obj.isVisited) {
            [self DFSGraphPrint:obj];
            *stop = YES;
        }
    }];
}

- (void)BFSGraph:(NSArray<GraphNode *> *)graph {
    if (!graph) {
        return;
    }
    [graph enumerateObjectsUsingBlock:^(GraphNode * _Nonnull node, NSUInteger idx, BOOL * _Nonnull stop) {
        printf("From vertex %ld: ", idx);
        if (!node.isVisited) {
            printf("[%ld]", node.val);
            node.isVisited = YES;
        }
        [node.neighbors enumerateObjectsUsingBlock:^(GraphNode * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if (!obj.isVisited) {
                printf("[%ld]", obj.val);
                obj.isVisited = YES;
            }
        }];
        printf("\n");
    }];
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

/*
 //找根节点到叶节点的路径, 使得路径结点的值的和是sum (113)
 TreeNode *a = [[TreeNode alloc] initWithValue:5];
 TreeNode *b = [[TreeNode alloc] initWithValue:4];
 TreeNode *c = [[TreeNode alloc] initWithValue:8];
 TreeNode *d = [[TreeNode alloc] initWithValue:11];
 TreeNode *e = [[TreeNode alloc] initWithValue:13];
 TreeNode *f = [[TreeNode alloc] initWithValue:4];
 TreeNode *g = [[TreeNode alloc] initWithValue:7];
 TreeNode *h = [[TreeNode alloc] initWithValue:2];
 TreeNode *x = [[TreeNode alloc] initWithValue:5];
 TreeNode *y = [[TreeNode alloc] initWithValue:1];
 a.left = b; a.right = c; b.left = d;
 b.right = e; c.right = f; c.left = e;
 d.left = g; d.right = h; f.left = x;
 f.right = y;
 NSMutableArray<NSMutableArray<TreeNode *> *> *allPaths = [bTreeGraphicTopics pathSum:a sum:22];
 printf("全部路径:\n");
 [allPaths enumerateObjectsUsingBlock:^(NSMutableArray<TreeNode *> * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
 [obj enumerateObjectsUsingBlock:^(TreeNode * _Nonnull treeNode, NSUInteger idx, BOOL * _Nonnull stop) {
 printf("[%ld]", (long)treeNode.val);
 }];
 printf("\n");
 }];
 */

/*
 //找根节点到某个节点的路径
 TreeNode *a = [[TreeNode alloc] initWithValue:5];
 TreeNode *b = [[TreeNode alloc] initWithValue:4];
 TreeNode *c = [[TreeNode alloc] initWithValue:8];
 TreeNode *d = [[TreeNode alloc] initWithValue:11];
 TreeNode *e = [[TreeNode alloc] initWithValue:13];
 TreeNode *f = [[TreeNode alloc] initWithValue:4];
 TreeNode *g = [[TreeNode alloc] initWithValue:7];
 TreeNode *h = [[TreeNode alloc] initWithValue:2];
 TreeNode *x = [[TreeNode alloc] initWithValue:5];
 TreeNode *y = [[TreeNode alloc] initWithValue:1];
 a.left = b; a.right = c; b.left = d;
 b.right = e; c.right = f; c.left = e;
 d.left = g; d.right = h; f.left = x;
 f.right = y;
 TreeNode *node1 = a, *node2 = y;
 NSMutableArray<TreeNode *> *result = [bTreeGraphicTopics findPathFromRoot:node1 toNode:node2];
 printf("node1到node2的路径:\n");
 [result enumerateObjectsUsingBlock:^(TreeNode * _Nonnull node, NSUInteger idx, BOOL * _Nonnull stop) {
 printf("[%ld]", (long)node.val);
 }];
 printf("\n");
 }
 */

/*
 //最低公共祖先 (236)
 TreeNode *a = [[TreeNode alloc] initWithValue:3];
 TreeNode *b = [[TreeNode alloc] initWithValue:5];
 TreeNode *c = [[TreeNode alloc] initWithValue:1];
 TreeNode *d = [[TreeNode alloc] initWithValue:6];
 TreeNode *e = [[TreeNode alloc] initWithValue:2];
 TreeNode *f = [[TreeNode alloc] initWithValue:0];
 TreeNode *x = [[TreeNode alloc] initWithValue:8];
 TreeNode *y = [[TreeNode alloc] initWithValue:7];
 TreeNode *z = [[TreeNode alloc] initWithValue:4];
 a.left = b; a.right = c; b.left = d;
 b.right = e; c.left = f; c.right = x;
 e.left = y; e.right = z;
 TreeNode *node1 = b, *node2 = f;
 TreeNode *result = [bTreeGraphicTopics lowestCommonAncestor:a node1:node1 node2:node2];
 printf("node1和node2最低公共节点: %ld\n", result.val);
 node1 = d; node2 = z;
 result = [bTreeGraphicTopics lowestCommonAncestor:a node1:node1 node2:node2];
 printf("node1和node2最低公共节点: %ld\n", result.val);
 node1 = b; node2 = y;
 result = [bTreeGraphicTopics lowestCommonAncestor:a node1:node1 node2:node2];
 printf("node1和node2最低公共节点: %ld\n", result.val);
 printf("\n");
 */

/*
 //将二叉树转化成单链表, left=nil, right指向下个节点, 单链表节点顺序是前序遍历的顺序 (114) 非就地转换
 TreeNode *a = [[TreeNode alloc] initWithValue:3];
 TreeNode *b = [[TreeNode alloc] initWithValue:5];
 TreeNode *c = [[TreeNode alloc] initWithValue:1];
 TreeNode *d = [[TreeNode alloc] initWithValue:6];
 TreeNode *e = [[TreeNode alloc] initWithValue:2];
 TreeNode *f = [[TreeNode alloc] initWithValue:0];
 TreeNode *x = [[TreeNode alloc] initWithValue:8];
 TreeNode *y = [[TreeNode alloc] initWithValue:7];
 TreeNode *z = [[TreeNode alloc] initWithValue:4];
 a.left = b; a.right = c; b.left = d;
 b.right = e; c.left = f; c.right = x;
 e.left = y; e.right = z;
 TreeNode *root = a;
 [bTreeGraphicTopics flattenTreeNotInPlace:root];
 @try {
 while (root) {
 printf("[%ld]", root.val);
 if (root.left) {
 @throw e; //存在左子树抛出异常
 }
 root = root.right;
 }
 printf("\n");
 } @catch (NSException *exception) {
 printf("反转异常");
 } @finally {
 ;
 }
 */

/*
 //层次打印二叉树
 TreeNode *a = [[TreeNode alloc] initWithValue:3];
 TreeNode *b = [[TreeNode alloc] initWithValue:5];
 TreeNode *c = [[TreeNode alloc] initWithValue:1];
 TreeNode *d = [[TreeNode alloc] initWithValue:6];
 TreeNode *e = [[TreeNode alloc] initWithValue:2];
 TreeNode *f = [[TreeNode alloc] initWithValue:0];
 TreeNode *x = [[TreeNode alloc] initWithValue:8];
 TreeNode *y = [[TreeNode alloc] initWithValue:7];
 TreeNode *z = [[TreeNode alloc] initWithValue:4];
 a.left = b; a.right = c; b.left = d;
 b.right = e; c.left = f; c.right = x;
 e.left = y; e.right = z;
 TreeNode *root = a;
 [bTreeGraphicTopics BFSPrint:root];
 */

/*
 //侧面观察二叉树 (199)
 //        TreeNode *a = [[TreeNode alloc] initWithValue:3];
 //        TreeNode *b = [[TreeNode alloc] initWithValue:5];
 //        TreeNode *c = [[TreeNode alloc] initWithValue:1];
 //        TreeNode *d = [[TreeNode alloc] initWithValue:6];
 //        TreeNode *e = [[TreeNode alloc] initWithValue:2];
 //        TreeNode *f = [[TreeNode alloc] initWithValue:0];
 //        TreeNode *x = [[TreeNode alloc] initWithValue:8];
 //        TreeNode *y = [[TreeNode alloc] initWithValue:7];
 //        TreeNode *z = [[TreeNode alloc] initWithValue:4];
 //        a.left = b; a.right = c; b.left = d;
 //        b.right = e; c.left = f; c.right = x;
 //        e.left = y; e.right = z;
 //        TreeNode *root = a;
 TreeNode *a = [[TreeNode alloc] initWithValue:1];
 TreeNode *b = [[TreeNode alloc] initWithValue:2];
 TreeNode *c = [[TreeNode alloc] initWithValue:5];
 TreeNode *d = [[TreeNode alloc] initWithValue:3];
 TreeNode *e = [[TreeNode alloc] initWithValue:4];
 TreeNode *f = [[TreeNode alloc] initWithValue:6];
 a.left = b; a.right = c;
 b.left = d; b.right = e;
 c.right = f;
 TreeNode *root = a;
 NSMutableArray<NSNumber *> *result = [bTreeGraphicTopics rightSideView:root];
 [result enumerateObjectsUsingBlock:^(NSNumber * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
 printf("[%ld]", [obj integerValue]);
 }];
 printf("\n");
 */
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

