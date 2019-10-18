//
//  StackQueueTopics.h
//  CSFundamentals
//
//  Created by Hui,Li on 2019/10/7.
//  Copyright © 2019 Hui,Li. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class Queue;

@interface StackQueueTopics : NSObject

//简化linux路径格式，例如将/home/->/home, /a/b/./c->/a/b/c, /a/b/../-> /a, '.'和'..'分别代表当前路径和返回上一个目录
- (NSString *)simplifyPath:(NSString *)path;

//是否是合法的括号序列，例如"{}[]()"->true, "{{{}]]"->false
- (BOOL)isValidParentheses:(NSString *)parentheses;

@end

@interface MyStack : NSObject

//用队列实现栈, 队头作为栈的top，即栈顶元素
- (void)push:(id)obj;

- (nullable id)pop;

- (nullable id)top;

- (BOOL)empty;

@end

NS_ASSUME_NONNULL_END
