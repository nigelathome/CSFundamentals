//
//  main.m
//  CSAlgorithms
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
#import "HashMapTopics.h"

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
        HashMapTopics *hashMapTopics = [[HashMapTopics alloc] init];
        
        NSString *s1 = @"abcbadab";
        NSUInteger len1 = [hashMapTopics lengthOfLongestSubstring:s1];
        printf("%s : %ld\n", [s1 UTF8String], len1);
        
        NSString *s2 = @"aaaaaaa";
        NSUInteger len2 = [hashMapTopics lengthOfLongestSubstring:s2];
        printf("%s : %ld\n", [s2 UTF8String], len2);
    }
    return 0;
}
