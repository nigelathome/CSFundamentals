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

//分组变位词 (49) 单词排序之后构建key的方法
- (NSArray<NSArray<NSString *> *> *)groupAnagrams:(NSArray<NSString *> *)strs;
- (NSString *)stringSort:(NSString *)str;//对str中的字母排序后返回新的字符串对象

//分组变位词 (49) 每个字母出现的次数构建key的方法
- (NSArray<NSArray<NSString *> *> *)groupAnagramsWithStringKey:(NSArray<NSString *> *)strs;
- (NSString *)toArrayKey:(NSString *)str;//对str构建数组key

//最长无重复字符的子串 (3)
- (NSUInteger)lengthOfLongestSubstring:(NSString *)s;
- (BOOL)hasRepeatedString:(NSMapTable<NSNumber * , NSNumber *> *)map; //是否还有重复的字符

//找出所有长度10且出现次数超过1次的DNA子串 (187)
- (NSArray<NSString *> *)findRepeatedDnaSequences:(NSString *)s;

//最小窗口子串 (76)
- (NSString *)minWindow:(NSString *)s pattern:(NSString *)t;
- (BOOL)isContainedAllCharacters:(NSMapTable<NSString *, NSNumber *> *)map patternMap:(NSMapTable<NSString *, NSNumber *> *)patternMap; //map是否包含patternMap

@end

NS_ASSUME_NONNULL_END
