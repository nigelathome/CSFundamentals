//
//  StackQueueTopics.m
//  CSFundamentals
//
//  Created by Hui,Li on 2019/10/7.
//  Copyright © 2019 Hui,Li. All rights reserved.
//

#import "StackQueueTopics.h"
#import "Stack.h"

@implementation StackQueueTopics

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

# pragma test-code
/*
StackQueueTopics *stackQueueTopics = [StackQueueTopics new];
NSString *path = @"//";
//        @"//简化linux路径格式，例如将/home/->/home, /a/b/./c->/a/b/c, /a/b/../-> /a, '.'和'..'分别代表当前路径和返回上一个目录"
NSString *simplifyPath = [stackQueueTopics simplifyPath:path];
NSLog(@"original path: %@, simpfied path: %@", path, simplifyPath);
 */

@end
