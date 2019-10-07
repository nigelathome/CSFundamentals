//
//  StackQueueTopics.m
//  CSFundamentals
//
//  Created by Hui,Li on 2019/10/7.
//  Copyright © 2019 Hui,Li. All rights reserved.
//

#import "StackQueueTopics.h"

@implementation StackQueueTopics

//简化linux路径格式，例如将/home/->/home, /a/b/./c->/a/b/c, /a/b/../-> /a, '.'和'..'分别代表当前路径和返回上一个目录
- (NSString *)simplifyPath:(NSString *)path {
//    return @"";
    
    NSArray *paths = [path componentsSeparatedByString:@"/"];
    
    return @"";
}

@end
