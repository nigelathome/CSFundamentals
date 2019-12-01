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
    
        printf("N queens solutions:============================\n");
        NSMutableArray<NSArray<NSString *> *> *result = [recBatkDivConqTopics solveNQueens:4];
        [result enumerateObjectsUsingBlock:^(NSArray<NSString *> * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            printf("第%ld情况: \n", (long)idx);
            for (NSString *row in obj) {
                printf("[ ");
                for (NSInteger i = 0; i < [row length]; i++) {
                    printf("%c ", [row characterAtIndex:i]);
                }
                printf("]\n");
            }
            printf("\n");
        }];
        
//        [stringArr enumerateObjectsUsingBlock:^(NSMutableString * _Nonnull _string, NSUInteger idx, BOOL * _Nonnull stop) {
//            for
//            printf("[");
//            NSLog(@"%@", _string);
//            printf(<#const char *restrict, ...#>)(@"%@", _string);
//            printf("]\n");
//        }];
        
    }
    return 0;
}
