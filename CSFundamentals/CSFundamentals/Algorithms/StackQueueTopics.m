//
//  StackQueueTopics.m
//  CSFundamentals
//
//  Created by Hui,Li on 2019/10/7.
//  Copyright © 2019 Hui,Li. All rights reserved.
//

#import "StackQueueTopics.h"
#import "Stack.h"
#import "Queue.h"

@implementation StackQueueTopics

#pragma mark - solutions

- (NSString *)simplifyPath:(NSString *)path {
    Stack *stack = [Stack new];
    NSArray *pathArray = [path componentsSeparatedByString:@"/"];
    NSMutableString *result = [NSMutableString new];
    
    for (id component in pathArray){
        if ([component isEqualToString:@"."]) continue; //'.'不做任何操作
        
        if ([component isEqualToString:@".."]) //'..'表示返回上一层目录,栈顶元素出栈
            if (![stack empty]) {
                [stack pop];
                continue;
            }
        
        if(![component isEqualToString:@""]) //其他非空元素入栈
            [stack push:component];
    }
    
    [stack enumerateObjectsFromBottom:^(id obj) {
        [result appendString:[NSString stringWithFormat:@"/%@", (NSString *)obj]];
    }];
    
    return [stack empty] ? @"/" : result;
}

- (BOOL)isValidParentheses:(NSString *)parentheses {
    if([parentheses length] == 0) return YES;
    if([parentheses length] == 1) return NO;
    Stack *stack = [Stack new];
    for(NSInteger i=0; i<[parentheses length]; i++) {
        unichar parChar = [parentheses characterAtIndex:i];
        NSString *par = [NSString stringWithFormat:@"%c", parChar];
        if ([@"([{" rangeOfString: par].location != NSNotFound) {
           [stack push:par];
        } else {
            if ([stack empty]) return NO;
            else {
                NSString *top = (NSString *)[stack top];
                if (([par isEqualToString:@")"] && [top isEqualToString:@"("])
                     ||([par isEqualToString:@"]"] && [top isEqualToString:@"["])
                    ||([par isEqualToString:@"}"] && [top isEqualToString:@"{"])
                     )
                    [stack pop];
                else
                    return NO;
            }
        }
    }
    return [stack empty];
}

#pragma mark - test-code
/*
StackQueueTopics *stackQueueTopics = [StackQueueTopics new];
NSString *path = @"//";
//        @"//简化linux路径格式，例如将/home/->/home, /a/b/./c->/a/b/c, /a/b/../-> /a, '.'和'..'分别代表当前路径和返回上一个目录"
NSString *simplifyPath = [stackQueueTopics simplifyPath:path];
NSLog(@"original path: %@, simpfied path: %@", path, simplifyPath);
 
 //        NSString *parenthesese = @"{}[]()";
 //        NSString *parenthesese = @"{{{}]]";
 NSString *parenthesese = @"]";
 BOOL valid = [stackQueueTopics isValidParentheses:parenthesese];
 NSLog(@"isValid=%@",valid?@"YES":@"NO");
 */


@end

@interface MyStack()

@property(nonatomic)Queue *data;

@end

@implementation MyStack

- (void)push:(id)obj {
    if ([self.data size] == 0) {
        [self.data push:obj];
        return;
    }
    Queue *tempQueue = [Queue new];
    [tempQueue push:obj];
    while (![self.data empty]) {//依次将data中的元素插入tempQueue
        [tempQueue push:[self.data front]];
        [self.data pop];
    }
    while (![tempQueue empty]) {//依次将tempQueue中的元素插入data
        [self.data push:[tempQueue front]];
        [tempQueue pop];
    }
}

- (nullable id)pop {
    id top = [self.data front];
    [self.data pop];
    return top;
}

- (nullable id)top {
    return [self.data front];
}

- (BOOL)empty {
    return [self.data empty];
}

- (Queue *)data {//data构造函数
    if (!_data){
        _data = [Queue new];
    }
    return _data;
        
}

@end
