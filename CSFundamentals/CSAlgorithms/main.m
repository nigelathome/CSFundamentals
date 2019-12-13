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
        
        NSString *pattern1 = @"abba", *str1 = @"dog cat cat dog";
        BOOL isMatch = [hashMapTopics wordPattern:pattern1 string:str1];
        printf("%s\n", isMatch ? "匹配" : "不匹配");
        NSString *pattern2 = @"abba", *str2 = @"dog cat cat fish";
        isMatch = [hashMapTopics wordPattern:pattern2 string:str2];
        printf("%s\n", isMatch ? "匹配" : "不匹配");
        NSString *pattern3 = @"aaaa", *str3 = @"dog cat cat dog";
        isMatch = [hashMapTopics wordPattern:pattern3 string:str3];
        printf("%s\n", isMatch ? "匹配" : "不匹配");
        NSString *pattern4 = @"abba", *str4 = @"dog dog dog dog";
        isMatch = [hashMapTopics wordPattern:pattern4 string:str4];
        printf("%s\n", isMatch ? "匹配" : "不匹配");
    }
    return 0;
}
