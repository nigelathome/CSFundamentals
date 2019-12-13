//
//  HashMapTopics.m
//  CSAlgorithms
//
//  Created by Hui,Li on 2019/12/10.
//  Copyright © 2019 Hui,Li. All rights reserved.
//

#import "HashMapTopics.h"

@implementation HashMapTopics

- (NSUInteger)longestPalindrome:(NSString *)s {
    //构造最长的回文串:通过统计s中出现偶数个的字符, 将其对称的放在字符串的两侧, 而对于奇数个的字符, 将其偶数个的字符通用对称的构造字符串, 将多出来的一个字符放在中间即可. ddaacccdd-d-ddcccaadd
    
    //key-value:字符-出现的次数
    NSMapTable<NSString *, NSNumber *> *charMap = [[NSMapTable alloc] init];
    __block BOOL odd = NO; //是否出现奇数个的字符
    __block NSInteger len = 0; //最大回文串长度
    
    //统计个字符出现的次数
    for (NSUInteger i = 0; i < s.length; i++) {
        NSString *ch = [NSString stringWithFormat:@"%c", [s characterAtIndex:i]];
        if ([charMap objectForKey:ch]) {
            NSInteger count = [[charMap objectForKey:ch] integerValue] + 1;
            [charMap setObject:[NSNumber numberWithInteger:count] forKey:ch];
        } else {
            [charMap setObject:[NSNumber numberWithInteger:1] forKey:ch];
        }
    }
    
    //计算可以构造的回文串的长度
    NSArray<NSString *> *allKeys = [[charMap keyEnumerator] allObjects]; //取出map中的所有key
    [allKeys enumerateObjectsUsingBlock:^(NSString * _Nonnull key, NSUInteger idx, BOOL * _Nonnull stop) {
        NSInteger count = [[charMap objectForKey:key] integerValue]; //每个字符出现的次数
        if (count % 2 == 0) { //出现次数是偶数, 所有的字符用来构造回文串, 回文串的长度+count
            len += count;
        } else { //出现次数是奇数数, 那么减去一个剩下偶数个字符用来构造回文串, 回文串的长度+count
            len += count - 1;
            odd = YES; //并标记odd, 以便将来对最大回文串的长度进行+1.如果存在多个字符次数是奇数的情形, 只增加任意一个奇数个的字符即可
        }
    }];
    
    return odd ? len + 1 : len;
}

- (BOOL)wordPattern:(NSString *)pattern string:(NSString *)str {
    //对str按空格进行分割
    NSArray<NSString *> *wordArray = [str componentsSeparatedByString:@" "];
    //定义映射key-value: pattern中的字母-words中的单词
    NSMapTable<NSString *, NSString *> *wordMap = [[NSMapTable alloc] init];
    
    if ([wordArray count] != pattern.length) { //pattern字符个数与word个数不等一定不匹配
        return NO;
    }
    
    //字母和单词逐个比较
    for (NSUInteger i = 0; i < pattern.length; i++) {
        //对pattern的每个字母和words的每个单词依次进行比对, 没出现过的则设置wordMap映射
        NSString *key = [NSString stringWithFormat:@"%c", [pattern characterAtIndex:i]];
        if ([wordMap objectForKey:key]) { //word之前出现过, 则判断跟之前的word对应的pattern中的字母是否相等
            NSString *wordInMap = [wordMap objectForKey:key];
            if (![wordInMap isEqualToString:wordArray[i]]) { //取出map中对应的字母对应的word比较, 不相等则一定不匹配
                return NO;
            }
        } else {
            NSArray<NSString *> *keyArray = [[wordMap keyEnumerator] allObjects];
            __block BOOL isInMap = NO;
            [keyArray enumerateObjectsUsingBlock:^(NSString * _Nonnull keyString, NSUInteger idx, BOOL * _Nonnull stop) {
                NSString *wordValue = [wordMap objectForKey:keyString];
                if ([wordValue isEqualToString:wordArray[i]]) {
                    isInMap = YES;
                    *stop = YES;
                }
            }];
            if (isInMap) {
                return NO; //word出现过, 但对应的key没有出现过, 则不匹配
            } else { //word之前没有出现过,并且没在map中, 则添加到hash map中去. 设置word和当前的字符对应
                [wordMap setObject:wordArray[i] forKey:key];
            }
        }
    }
    return YES;
}

#pragma mark test-code
/*
 //hash表的插入和删除
 NSMutableArray<ListNode *> *list = [[NSMutableArray alloc] init];
 NSArray<NSNumber *> *nums = [NSArray arrayWithObjects:@1, @1, @4, @9, @20, @30, @150, @500, nil];
 [nums enumerateObjectsUsingBlock:^(NSNumber * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
 ListNode *node = [[ListNode alloc] initWithValue:[obj integerValue]];
 [list addObject:node];
 }];
 HashMap *hashMap = [[HashMap alloc] init];
 [list enumerateObjectsUsingBlock:^(ListNode * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
 [hashMap insert:obj];
 }];
 printf("\nTest insert: \n");
 [hashMap printHashTable];
 printf("\nTest search: \n");
 for (NSUInteger i = 0; i < 10; i++) {
 ListNode *node = [[ListNode alloc] initWithValue:i];
 if ([hashMap search:node]) {
 printf("%ld is in the hash table.\n", i);
 } else {
 printf("%ld is not in the hash table.\n", i);
 }
 }
 */

/*
 //最长的回文字符串 (409)
 NSString *s = @"abccccddaa";
 NSInteger len = [hashMapTopics longestPalindrome:s];
 printf("可以构造的最大回文串的长度: %ld\n", len);
 */
@end
