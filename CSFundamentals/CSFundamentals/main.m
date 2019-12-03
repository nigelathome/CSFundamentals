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
    }
    return 0;
}
