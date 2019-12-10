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
#import "BinarySearchTopics.h"
#import "HashMap.h"

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
        BinarySearchTopics *binarySearchTopics = [[BinarySearchTopics alloc] init];
        
        NSMutableArray<ListNode *> *list = [[NSMutableArray alloc] init];
        NSArray<NSNumber *> *nums = [NSArray arrayWithObjects:@1, @1, @4, @9, @20, @30, @150, @500, nil];
        [nums enumerateObjectsUsingBlock:^(NSNumber * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            ListNode *node = [[ListNode alloc] initWithValue:[obj integerValue]];
            [list addObject:node];
        }];
        HashMap *hashMap = [[HashMap alloc] init];
        [list enumerateObjectsUsingBlock:^(ListNode * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [hashMap insert:obj];
        }];
        printf("\nTest insert: \n");
        [hashMap printHashTable];
        printf("\nTest search: \n");
        for (NSUInteger i = 0; i < 10; i++) {
            ListNode *node = [[ListNode alloc] initWithValue:i];
            if ([hashMap search:node]) {
                printf("%ld is in the hash table.\n", i);
            } else {
                printf("%ld is not in the hash table.\n", i);
            }
        }
    }
    return 0;
}
