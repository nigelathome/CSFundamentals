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
        
        NSMutableArray<NSString *> *result = [recBatkDivConqTopics generateAllPossibleParenthesis:2];
        [result enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            for (NSUInteger i = 0; i < [obj length]; i++) {
                unichar ch = [obj characterAtIndex:i];
                printf("%c", ch);
            }
            printf("\n");
        }];
//        NSMutableString *items = [[NSMutableString alloc] init];
//        [items appendString:@"((("];
//        NSRange last = NSMakeRange([items length] - 1, 1); //将字符串最后一个字符换成')'
//        [items deleteCharactersInRange:last];
//        [items appendString:@")"];
//        NSLog(@"%@", (NSString *)items);
    }
    return 0;
}
