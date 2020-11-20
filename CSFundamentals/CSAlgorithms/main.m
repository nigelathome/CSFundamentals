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
#import "TrieNode.h"

#define DebugNSLog(formater,...) NSLog((@"\n====================\n >>> class: %s\n\n >>> method: %s\n\n" " >>> code line: %d 行\n\n >>> message: "  formater @"\n==================="),__FILE__,__FUNCTION__,__LINE__,##__VA_ARGS__)

void increase(int *x){
    printf("&x:%p x:%p *x:%d\n",&x,x,*x); //与实参的地址一定不同！
    int b = 2;
    x = &b;
    printf("&x:%p x:%p *x:%d\n",&x,x,*x);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        NSLog(@"Hello, US!");
//        NSLog(@"Hello, CHINA!");
//
//        StackQueueHeapTopics *stackQueueHeadTopics = [[StackQueueHeapTopics alloc] init];
//        LinkedListTopics *linkedListTopics = [[LinkedListTopics alloc] init];
//        DPTopics *dPTopics = [[DPTopics alloc] init];
//        StringTopics *stringTopics = [[StringTopics alloc] init];
//        GreedyTopics *greedyTopics = [[GreedyTopics alloc] init];
//        RecBatkDivConqTopics *recBatkDivConqTopics = [[RecBatkDivConqTopics alloc] init];
//        BTreeGraphicTopics *bTreeGraphicTopics = [[BTreeGraphicTopics alloc] init];
//        BinarySearchTopics *binarySearchTopics = [[BinarySearchTopics alloc] init];
//        HashMapTopics *hashMapTopics = [[HashMapTopics alloc] init];
//
//        NSMapTable<NSString *, NSNumber*> *map_t = [[NSMapTable alloc] init];
//        NSMapTable<NSString *, NSNumber*> *map_s = [[NSMapTable alloc] init];
//        [map_t setObject:@1 forKey:@"A"];
//        [map_t setObject:@1 forKey:@"B"];
//        [map_t setObject:@1 forKey:@"C"];
//        [map_s setObject:@1 forKey:@"A"];
//        [map_s setObject:@1 forKey:@"D"];
//        [map_s setObject:@1 forKey:@"O"];
//        [map_s setObject:@1 forKey:@"B"];
//        [map_s setObject:@1 forKey:@"E"];
//        [map_s setObject:@1 forKey:@"C"];
//        BOOL isContained = [hashMapTopics isContainedAllCharacters:map_s patternMap:map_t];
//        printf("%s\n", isContained? "YES": "NO");
//
//        printf("result:\n");
//        NSString *s = @"ADOBECODEBANC";
//        NSString *t = @"ABC";
//        NSString *r = [hashMapTopics minWindow:s pattern:t];
//        printf("s=%s, t=%s, result=%s\n", [s UTF8String], [t UTF8String], [r UTF8String]);
//
//        s = @"MADOBCCABEC";
//        t = @"ABCC";
//        r = [hashMapTopics minWindow:s pattern:t];
//        printf("s=%s, t=%s, result=%s\n", [s UTF8String], [t UTF8String], [r UTF8String]);
//
//        s = @"aa";
//        t = @"aa";
//        r = [hashMapTopics minWindow:s pattern:t];
//        printf("s=%s, t=%s, result=%s\n", [s UTF8String], [t UTF8String], [r UTF8String]);
        
        TrieNode *root = [[TrieNode alloc] init];
        TrieNode *n1 = [[TrieNode alloc] init];
        TrieNode *n2 = [[TrieNode alloc] init];
        TrieNode *n3 = [[TrieNode alloc] init];
        
        [root.child setValue:n1 forKey:[NSString stringWithFormat:@"%c", 'a']];
        [root.child setValue:n2 forKey:[NSString stringWithFormat:@"%c", 'b']];
        [root.child setValue:n3 forKey:[NSString stringWithFormat:@"%c", 'e']];
        n2.isEnd = YES;
        
        TrieNode *n4 = [[TrieNode alloc] init];
        TrieNode *n5 = [[TrieNode alloc] init];
        TrieNode *n6 = [[TrieNode alloc] init];
        [n1.child setValue:n4 forKey:[NSString stringWithFormat:@"%c", 'b']];
        [n2.child setValue:n5 forKey:[NSString stringWithFormat:@"%c", 'c']];
        [n3.child setValue:n6 forKey:[NSString stringWithFormat:@"%c", 'f']];
        
        TrieNode *n7 = [[TrieNode alloc] init];
        TrieNode *n8 = [[TrieNode alloc] init];
        TrieNode *n9 = [[TrieNode alloc] init];
        TrieNode *n10 = [[TrieNode alloc] init];
        [n4.child setValue:n7 forKey:[NSString stringWithFormat:@"%c", 'c']];
        [n4.child setValue:n8 forKey:[NSString stringWithFormat:@"%c", 'd']];
        [n5.child setValue:n9 forKey:[NSString stringWithFormat:@"%c", 'c']];
        [n6.child setValue:n10 forKey:[NSString stringWithFormat:@"%c", 'g']];
        n7.isEnd = YES;
        n8.isEnd = YES;
        n9.isEnd = YES;
        n10.isEnd = YES;
        
        TrieNode *n11 = [[TrieNode alloc] init];
        [n7.child setValue:n11 forKey:[NSString stringWithFormat:@"%c", 'd']];
        n11.isEnd = YES;
        
//        [root preorderTrie:0];
        NSMutableString *words = [[NSMutableString alloc] init];
        NSMutableArray *result = [[NSMutableArray alloc] init];
        [root getWordsFromTrie:words result:result];
        
    }
    return 0;
}

/*
 查看工程代码行数
 find . "(" -name "*.m" -or -name "*.mm" -or -name "*.cpp" -or -name "*.h" -or -name "*.rss" ")" -print | xargs wc -l
 */
