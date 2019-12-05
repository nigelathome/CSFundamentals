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
#import "GraphNode.h"

#define DebugNSLog(formater,...) NSLog((@"\n====================\n >>> class: %s\n\n >>> method: %s\n\n" " >>> code line: %d 行\n\n >>> message: "  formater @"\n==================="),__FILE__,__FUNCTION__,__LINE__,##__VA_ARGS__)

void increase(int *x){
    printf("&x:%p x:%p *x:%d\n",&x,x,*x); //与实参的地址一定不同！
    int b = 2;
    x = &b;
    printf("&x:%p x:%p *x:%d\n",&x,x,*x);
}

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
        
        NSMutableArray<GraphNode *> *nodesArray = [[NSMutableArray alloc] init];
        for (NSUInteger i = 0; i < 5; i++) { //构造节点
            GraphNode *graphNode = [[GraphNode alloc] initWithValue:i];
            [nodesArray addObject:graphNode];
        }
        //构造有向边
        [nodesArray[0].neighbors addObject:nodesArray[2]];
        [nodesArray[0].neighbors addObject:nodesArray[4]];
        [nodesArray[1].neighbors addObject:nodesArray[0]];
        [nodesArray[1].neighbors addObject:nodesArray[2]];
        [nodesArray[2].neighbors addObject:nodesArray[3]];
        [nodesArray[3].neighbors addObject:nodesArray[4]];
        [nodesArray[4].neighbors addObject:nodesArray[3]];
        
        [bTreeGraphicTopics DFSGraph:nodesArray];
        
//        printf("Graph: \n");
//        [nodesArray enumerateObjectsUsingBlock:^(GraphNode * _Nonnull node, NSUInteger idx, BOOL * _Nonnull stop) {
//            printf("%ld:", node.val);
//            [node.neighbors enumerateObjectsUsingBlock:^(GraphNode * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//                printf(" %ld ", obj.val);
//            }];
//            printf("\n");
//        }];
    }
    return 0;
}
