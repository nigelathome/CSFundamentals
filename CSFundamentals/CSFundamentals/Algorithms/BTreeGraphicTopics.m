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


@end
