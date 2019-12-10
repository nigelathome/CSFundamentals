//
//  HashMap.h
//  CSAlgorithms
//
//  Created by Hui,Li on 2019/12/10.
//  Copyright © 2019 Hui,Li. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class ListNode;

@interface HashMap : NSObject

@property (nonatomic, nullable) NSMutableArray<ListNode *> *hashTable;

//插入元素
- (void)insert:(ListNode *)node;

//查找元素
- (BOOL)search:(ListNode *)node;

//hash函数
- (NSUInteger)hashFunc:(NSInteger)value;

//打印hash表
- (void)printHashTable;

@end

NS_ASSUME_NONNULL_END
