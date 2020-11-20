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

@end
