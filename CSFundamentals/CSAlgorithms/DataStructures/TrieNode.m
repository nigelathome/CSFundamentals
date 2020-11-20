//
//  TrieNode.m
//  CSAlgorithms
//
//  Created by Hui,Li on 2020/11/20.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#import "TrieNode.h"

@implementation TrieNode

- (instancetype)init {
    self = [super init];
    if (self) {
        self.isEnd = NO;
        self.child = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (void)preorderTrie:(NSInteger)layer {
    for (NSInteger i = 0; i < 26; i++) {
        NSString *key = [NSString stringWithFormat:@"%c", (unichar)(i+'a')];
        TrieNode *node = [self.child objectForKey:key];
        if (node) {
            for (NSInteger j = 0; j<layer; j++) {
                printf("---");
            }
            printf("%s", [key UTF8String]);
            if (node.isEnd) {
                printf("<end>");
            }
            printf("\n");
            [node preorderTrie:layer+1];
        }
    }
}

- (void)getWordsFromTrie:(NSMutableString *)words result:(NSMutableArray<NSString *> *)result {
    for (NSInteger i = 0; i < 26; i++) {
        NSString *key = [NSString stringWithFormat:@"%c", (unichar)(i+'a')];
        TrieNode *node = [self.child objectForKey:key];
        if (node) {
            [words appendString:key];
            if (node.isEnd) {
                printf("%s\n", [words UTF8String]);
                [result addObject:words];
                
            }
            [node getWordsFromTrie:words result:result];
            [words deleteCharactersInRange:NSMakeRange(words.length-1, 1)];
        }
    }
}

@end
