//
//  Queue.h
//  CSAlgorithms
//
//  Created by Hui,Li on 2019/10/18.
//  Copyright © 2019 Hui,Li. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Queue : NSObject

//返回最后一个元素
- (nullable id)back;

//判断队列是否为空
- (BOOL)empty;

//返回第一个元素
- (nullable id)front;

//删除第一个元素
- (void)pop;

//在末尾加入一个元素
- (void)push:(id)obj;

//队列的元素个数
- (NSInteger)size;

//清空所以元素
- (void)removeAllObjects;

@end

@interface PriorityQueue : NSObject

//返回最后一个元素
- (nullable id)back;

//判断队列是否为空
- (BOOL)empty;

//返回第一个元素, 即堆顶元素
- (nullable id)front;

//删除第一个元素, 即堆顶元素
- (void)pop;

//加入一个元素
- (void)push:(id)obj;

//队列的元素个数
- (NSInteger)size;

//清空所有元素
- (void)removeAllObjects;

//打印所有元素
- (void)printObjects;

@property(nonatomic, assign)BOOL isSmallHeap; //是否是小顶堆

@end

NS_ASSUME_NONNULL_END
