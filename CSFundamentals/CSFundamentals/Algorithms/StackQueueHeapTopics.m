//
//  StackQueueTopics.m
//  CSFundamentals
//
//  Created by Hui,Li on 2019/10/7.
//  Copyright © 2019 Hui,Li. All rights reserved.
//

#import "StackQueueHeapTopics.h"
#import "Stack.h"
#import "Queue.h"

@implementation StackQueueHeapTopics

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

- (NSInteger)findKthLargest:(NSArray*)nums Kth:(NSInteger)k {
    assert(k>0);
    PriorityQueue *priorityQueue = [PriorityQueue new];
    [nums enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if(priorityQueue.size < k){
            [priorityQueue push:obj];
        } else {//堆中维护当前最大的k个数
            NSInteger top = [[priorityQueue front] integerValue];//堆中最小的元素
            NSInteger cur = [obj integerValue];
            if (cur > top) {
                [priorityQueue pop];
                [priorityQueue push:obj];
            }
        }
    }];
    return [[priorityQueue front] integerValue];
}

- (BOOL)checkIsValidOrder:(Queue*)order {
    Stack *stack = [Stack new];
    NSInteger size = order.size;
    for(NSInteger i = 1; i<=size; ++i){ //进栈顺序1->n
        [stack push:[NSNumber numberWithInteger:i]];
        while (![stack empty] && ![order empty]
               &&
               [(NSNumber*)[stack top] integerValue] == [(NSNumber*)[order front] integerValue]) {
            [stack pop];
            [order pop];
        }
    }
    if ([stack empty]) {
        return YES;
    }
    return NO;
}

@end

#pragma mark test-code
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
 
 NSArray *nums = @[@(3), @(2), @(1), @(5), @(6), @(4)];
 NSInteger result = [stackQueueHeadTopics findKthLargest:nums Kth:0];
 NSLog(@"%ld", result);
 
 Queue *order = [Queue new];
 //        [order push:[NSNumber numberWithInteger:3]];
 //        [order push:[NSNumber numberWithInteger:2]];
 //        [order push:[NSNumber numberWithInteger:5]];
 //        [order push:[NSNumber numberWithInteger:4]];
 //        [order push:[NSNumber numberWithInteger:1]];
 
 [order push:[NSNumber numberWithInteger:5]];
 [order push:[NSNumber numberWithInteger:1]];
 [order push:[NSNumber numberWithInteger:2]];
 [order push:[NSNumber numberWithInteger:4]];
 [order push:[NSNumber numberWithInteger:3]];
 BOOL isvalid = [stackQueueHeadTopics checkIsValidOrder:order];
 NSLog(@"是否合法:%@", @(isvalid));
 */

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
    [tempQueue push:obj];//obj先入临时队列
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

#pragma mark test-code
/*
 MyStack *myStack = [MyStack new];
 [myStack push:[NSNumber numberWithInteger:1]];
 [myStack push:[NSNumber numberWithInteger:2]];
 [myStack push:[NSNumber numberWithInteger:3]];
 [myStack push:[NSNumber numberWithInteger:4]];
 NSLog(@"%d\n", (int)[[myStack top] integerValue]);
 [myStack pop];
 NSLog(@"%d\n", (int)[[myStack top] integerValue]);
 [myStack push:[NSNumber numberWithInteger:5]];
 NSLog(@"%d\n", (int)[[myStack top] integerValue]);
 */

@interface MyQueue()

@property(nonatomic)Stack *data;

@end

@implementation MyQueue

- (void)push:(id)obj {
    if ([self.data empty]){
        [self.data push:obj];
        return;
    }
    Stack *tempStack = [Stack new];
    while(![self.data empty]){
        [tempStack push:[self.data top]];
        [self.data pop];
    }
    [tempStack push:obj];
    while (![tempStack empty]) {
        [self.data push:[tempStack top]];
        [tempStack pop];
    }
}

- (nullable id)pop {
    id top = [self.data top];
    [self.data pop];
    return top;
}

- (nullable id)peek {
    return [self.data top];
}

- (BOOL)empty {
    return [self.data empty];
}

- (Stack *)data {
    if (!_data){
        _data = [Stack new];
    }
    return _data;
}

@end
# pragma mark test-code
/*
 MyQueue *myQueue = [MyQueue new];
 [myQueue push:[NSNumber numberWithInteger:1]];
 [myQueue push:[NSNumber numberWithInteger:2]];
 [myQueue push:[NSNumber numberWithInteger:3]];
 [myQueue push:[NSNumber numberWithInteger:4]];
 NSLog(@"%d\n", (int)[[myQueue peek] integerValue]);
 [myQueue pop];
 NSLog(@"%d\n", (int)[[myQueue peek] integerValue]);
 */

@interface MinStack()

@property(nonatomic)Stack *data;//存储数据

@property(nonatomic)Stack *mins;//保存当前栈中的最新元素

@end

@implementation MinStack

- (void)push:(id)obj {
    if ([self.data empty]){
        [self.mins push:obj];
    } else {//mins记录当前栈的最小元素
        NSNumber *topValue = (NSNumber*)[self.mins top];
        if ([(NSNumber*)obj integerValue] < [topValue integerValue]) {
            [self.mins push:obj];
        } else {
            [self.mins push:[self.mins top]];
        }
    }
    [self.data push:obj];
}

- (nullable id)pop {
    id top = [self.data top];
    [self.data pop];
    [self.mins pop];//两个栈同时出栈
    return top;
}

- (nullable id)top {
    return [self.data top];
}

- (nullable id)getMin {
    return [self.mins top];
}

- (Stack *)data {
    if (!_data){
        _data = [Stack new];
    }
    return _data;
}

- (Stack *)mins {
    if (!_mins){
        _mins = [Stack new];
    }
    return _mins;
}

#pragma mark test-code
/*
 MinStack *minStack = [MinStack new];
 [minStack push:[NSNumber numberWithInteger:-2]];
 NSLog(@"top = [%d]\n", (int)[[minStack top] integerValue]);
 NSLog(@"min = [%d]\n\n", (int)[[minStack getMin] integerValue]);
 [minStack push:[NSNumber numberWithInteger:0]];
 NSLog(@"top = [%d]\n", (int)[[minStack top] integerValue]);
 NSLog(@"min = [%d]\n\n", (int)[[minStack getMin] integerValue]);
 [minStack push:[NSNumber numberWithInteger:-5]];
 NSLog(@"top = [%d]\n", (int)[[minStack top] integerValue]);
 NSLog(@"min = [%d]\n\n", (int)[[minStack getMin] integerValue]);
 [minStack pop];
 NSLog(@"top = [%d]\n", (int)[[minStack top] integerValue]);
 NSLog(@"min = [%d]\n\n", (int)[[minStack getMin] integerValue]);
 */

@end

@interface MedianFinder()

@property(nonatomic)PriorityQueue *big;
@property(nonatomic)PriorityQueue *small;

@end

@implementation MedianFinder

- (instancetype)init {
    self = [super init];
    if (self) {
        _big = [PriorityQueue new];
        _small = [PriorityQueue new];
        _big.isSmallHeap = NO;
        _small.isSmallHeap = YES;
    }
    return self;
}

//分别将n个数分成相等两份,或者每份的个数之差不超过1,用大顶堆维护较小一摞的元素,用小顶堆维护大的一摞元素
- (void)addNum:(NSInteger)num {
    if ([self.big empty]) {//第一个元素先插入大顶堆,小顶堆也可
        [self.big push:[NSNumber numberWithInteger:num]];
        return;
    }
    //两个堆相等,那么将大的元素插入小顶堆,小的元素插入大顶堆
    if (self.big.size == self.small.size){
        NSInteger top = [(NSNumber*)[self.big front] integerValue];
        if (top>num) {
            [self.big push:[NSNumber numberWithInteger:num]];
        } else {
            [self.small push:[NSNumber numberWithInteger:num]];
        }
        
    //大顶堆元素多,待插入的元素大就插入小顶堆;待插入的元素小,先把大顶堆并把堆顶元素插入小顶堆,再把元素插入大顶堆
    } else if ((self.big.size > self.small.size)){
        NSInteger top = [(NSNumber*)[self.big front] integerValue];
        if (top>num) {
            [self.small push:[self.big front]];
            [self.big pop];
            [self.big push:[NSNumber numberWithInteger:num]];
        } else {
            [self.small push:[NSNumber numberWithInteger:num]];
        }
    
    //小顶堆元素多,待插入的元素小就插入大顶堆;待插入的元素大,先把小顶堆的堆顶元素插入大顶堆,再把元素插入小顶堆
    } else {
        NSInteger top = [(NSNumber*)[self.small front] integerValue];
        if (top>num) {
            [self.big push:[NSNumber numberWithInteger:num]];
        } else {
            [self.big push:[self.small front]];
            [self.small pop];
            [self.small push:[NSNumber numberWithInteger:num]];
        }
    }
}

- (double)findMedian {
    if (self.big.size == self.small.size) {
        return ((double)[[self.big front] integerValue] + [[self.small front] integerValue])/2;
    }
    if (self.big.size > self.small.size) {
        return (double)[[self.big front] integerValue];
    }
    return (double)[[self.small front] integerValue];
}

@end
