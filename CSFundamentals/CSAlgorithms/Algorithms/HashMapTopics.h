//
//  HashMapTopics.h
//  CSAlgorithms
//
//  Created by Hui,Li on 2019/12/10.
//  Copyright © 2019 Hui,Li. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HashMapTopics : NSObject

//最长的回文字符串 (409)
- (NSUInteger)longestPalindrome:(NSString *)s;

//单词匹配 (290)
- (BOOL)wordPattern:(NSString *)pattern string:(NSString *)str;

//分组变位词 (49)
- (NSArray<NSArray<NSString *> *> *)groupAnagrams:(NSArray<NSString *> *)strs;
- (NSString *)stringSort:(NSString *)str;//对str中的字母排序后返回新的字符串对象

@end

NS_ASSUME_NONNULL_END
