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
        _isEnd = NO;
        _child = [[NSMutableDictionary alloc] init];
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

@implementation TrieTree

- (instancetype)init {
    self = [super init];
    if (self) {
    }
    return self;
}

- (TrieNode *)root {
    if (!_root) {
        _root = [[TrieNode alloc] init];
    }
    return _root;
}

- (void)insert:(NSString *)word {
    TrieNode *curNode = self.root;
    for (NSInteger i=0; i<word.length; i++) {
        unichar letter = [word characterAtIndex:i];
        NSString *key = [NSString stringWithFormat:@"%c", letter];
        if (![curNode.child objectForKey:key]) {
            //key不存在说明对应的word中该字母不在trie树中
            TrieNode *newNode = [[TrieNode alloc] init];
            [curNode.child setValue:newNode forKey:key];
        }
        TrieNode *childNode = [curNode.child objectForKey:key];
        curNode = childNode;//指向该孩子节点
    }
    curNode.isEnd = YES;
}

- (BOOL)search:(NSString *)word {
    TrieNode *curNode = self.root;
    for (NSInteger i=0; i<word.length; i++) {
        unichar letter = [word characterAtIndex:i];
        NSString *key = [NSString stringWithFormat:@"%c", letter];
        if (![curNode.child objectForKey:key]) {
            return NO;
        }
        TrieNode *childNode = [curNode.child objectForKey:key];
        curNode = childNode;//指向该孩子节点
    }
    return curNode.isEnd;
}

- (BOOL)startWith:(NSString *)prefix {
    TrieNode *curNode = self.root;
    for (NSInteger i=0; i<prefix.length; i++) {
        unichar letter = [prefix characterAtIndex:i];
        NSString *key = [NSString stringWithFormat:@"%c", letter];
        if (![curNode.child objectForKey:key]) {
            return NO;
        }
        TrieNode *childNode = [curNode.child objectForKey:key];
        curNode = childNode;//指向该孩子节点
    }
    return YES;
}

@end

#pragma mark test-code
/*
//trie树节点前序遍历、打印全部单次
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
 */
