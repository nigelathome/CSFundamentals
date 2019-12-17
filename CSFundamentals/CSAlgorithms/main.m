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
        
        NSMapTable<NSString *, NSNumber*> *map_t = [[NSMapTable alloc] init];
        NSMapTable<NSString *, NSNumber*> *map_s = [[NSMapTable alloc] init];
        [map_t setObject:@1 forKey:@"A"];
        [map_t setObject:@1 forKey:@"B"];
        [map_t setObject:@1 forKey:@"C"];
        [map_s setObject:@1 forKey:@"A"];
        [map_s setObject:@1 forKey:@"D"];
        [map_s setObject:@1 forKey:@"O"];
        [map_s setObject:@1 forKey:@"B"];
        [map_s setObject:@1 forKey:@"E"];
        [map_s setObject:@1 forKey:@"C"];
        BOOL isContained = [hashMapTopics isContainedAllCharacters:map_s patternMap:map_t];
        printf("%s\n", isContained? "YES": "NO");
        
        printf("result:\n");
        NSString *s = @"ADOBECODEBANC";
        NSString *t = @"ABC";
        NSString *r = [hashMapTopics minWindow:s pattern:t];
        printf("s=%s, t=%s, result=%s\n", [s UTF8String], [t UTF8String], [r UTF8String]);
        
        s = @"MADOBCCABEC";
        t = @"ABCC";
        r = [hashMapTopics minWindow:s pattern:t];
        printf("s=%s, t=%s, result=%s\n", [s UTF8String], [t UTF8String], [r UTF8String]);
        
        s = @"aa";
        t = @"aa";
        r = [hashMapTopics minWindow:s pattern:t];
        printf("s=%s, t=%s, result=%s\n", [s UTF8String], [t UTF8String], [r UTF8String]);
    }
    return 0;
}

/*
 查看工程代码行数
 find . "(" -name "*.m" -or -name "*.mm" -or -name "*.cpp" -or -name "*.h" -or -name "*.rss" ")" -print | xargs wc -l
 */
