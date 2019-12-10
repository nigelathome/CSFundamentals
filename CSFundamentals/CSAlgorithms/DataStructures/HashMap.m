//
//  HashMap.m
//  CSAlgorithms
//
//  Created by Hui,Li on 2019/12/10.
//  Copyright © 2019 Hui,Li. All rights reserved.
//

#import "HashMap.h"
#import "ListNode.h"

#define TABLE_LENGTH 11

@implementation HashMap

- (instancetype)init {
    self = [super init];
    if (self) {
        _hashTable = [[NSMutableArray alloc] init];
        for (NSUInteger i = 0; i < (TABLE_LENGTH); i++) {
            ListNode *dummy = [[ListNode alloc] initWithValue:-1]; //hashtable的每个首元素不存放实际的元素
            [_hashTable addObject:dummy];
        }
    }
    return self;
}

//插入元素
- (void)insert:(ListNode *)node {
    if (!node) {
        return;
    }
    NSUInteger key = [self hashFunc:node.val];
    ListNode *head = self.hashTable[key]; //实际元素存储在第二个节点
    node.next = head.next;//头插法
    self.hashTable[key].next = node;
}

//查找元素
- (BOOL)search:(ListNode *)node {
    NSUInteger key = [self hashFunc:node.val];
    ListNode *head = self.hashTable[key].next; //实际元素存储在第二个节点
    while (head) {
        if (head.val == node.val) {
            return YES;
        }
        head = head.next;
    }
    return NO;
}

- (NSUInteger)hashFunc:(NSInteger)value {
    return value % (TABLE_LENGTH);
}

- (void)printHashTable {
    printf("Hash table:\n");
    [self.hashTable enumerateObjectsUsingBlock:^(ListNode * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        printf("[%ld]:", idx);
        ListNode *head = obj.next;
        while (head) {
            printf("->%ld", head.val);
            head = head.next;
        }
        printf("\n");
    }];
}

@end
