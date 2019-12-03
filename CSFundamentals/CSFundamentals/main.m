//
//  main.m
//  CSFundamentals
//
//  Created by Hui,Li on 2019/10/2.
//  Copyright © 2019 Hui,Li. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LinkedListTopics.h"
#import "DPTopics.h"
#import "StackQueueHeapTopics.h"
#import "StringTopics.h"
#import "ListNode.h"
#import "Stack.h"
#import "Queue.h"
#import "GreedyTopics.h"
#import "RecBatkDivConqTopics.h"
#import "BTreeGraphicTopics.h"
#import "TreeNode.h"

#define DebugNSLog(formater,...) NSLog((@"\n====================\n >>> class: %s\n\n >>> method: %s\n\n" " >>> code line: %d 行\n\n >>> message: "  formater @"\n==================="),__FILE__,__FUNCTION__,__LINE__,##__VA_ARGS__)

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, US!");
        NSLog(@"Hello, CHINA!");
        
        StackQueueHeapTopics *stackQueueHeadTopics = [[StackQueueHeapTopics alloc] init];
        LinkedListTopics *linkedListTopics = [[LinkedListTopics alloc] init];
        DPTopics *dPTopics = [[DPTopics alloc] init];
        StringTopics *stringTopics = [[StringTopics alloc] init];
        GreedyTopics *greedyTopics = [[GreedyTopics alloc] init];
        RecBatkDivConqTopics *recBatkDivConqTopics = [[RecBatkDivConqTopics alloc] init];
        BTreeGraphicTopics *bTreeGraphicTopics = [[BTreeGraphicTopics alloc] init];
        
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
        
    }
    return 0;
}
