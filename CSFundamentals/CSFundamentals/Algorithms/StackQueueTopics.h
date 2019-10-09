//
//  StackQueueTopics.h
//  CSFundamentals
//
//  Created by Hui,Li on 2019/10/7.
//  Copyright © 2019 Hui,Li. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface StackQueueTopics : NSObject

//简化linux路径格式，例如将/home/->/home, /a/b/./c->/a/b/c, /a/b/../-> /a, '.'和'..'分别代表当前路径和返回上一个目录
- (NSString *)simplifyPath:(NSString *)path;
    
@end

NS_ASSUME_NONNULL_END
