//
//  StackQueueTopics.h
//  CSAlgorithms
//
//  Created by Hui,Li on 2019/10/7.
//  Copyright © 2019 Hui,Li. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class Queue;

@interface StackQueueHeapTopics : NSObject

//简化linux路径格式，例如将/home/->/home, /a/b/./c->/a/b/c, /a/b/../-> /a, '.'和'..'分别代表当前路径和返回上一个目录
- (NSString *)simplifyPath:(NSString *)path;

//是否是合法的括号序列，例如"{}[]()"->true, "{{{}]]"->false
- (BOOL)isValidParentheses:(NSString *)parentheses;

//查找第K大的元素
- (NSInteger)findKthLargest:(NSArray*)nums Kth:(NSInteger)Kth;

//1->n顺序入栈，判断一个出栈顺序是否合法。例如31245->NO, 32541->YES
- (BOOL)checkIsValidOrder:(Queue*)order;

@end

//用队列实现栈, 队头作为栈的top，即栈顶元素
@interface MyStack : NSObject

- (void)push:(id)obj;

- (nullable id)pop;

- (nullable id)top;

- (BOOL)empty;

@end

//用栈实现队列
@interface MyQueue : NSObject

- (void)push:(id)obj;

- (nullable id)pop;//移除队头元素

- (nullable id)peek;//获取队头元素

- (BOOL)empty;

@end

@interface MinStack : NSObject

- (void)push:(id)obj;

- (nullable id)pop;

- (nullable id)top;

- (nullable id)getMin;

@end

@interface MedianFinder : NSObject

//添加数据
- (void)addNum:(NSInteger)num;

//找中位数
- (double)findMedian;

@end

NS_ASSUME_NONNULL_END
