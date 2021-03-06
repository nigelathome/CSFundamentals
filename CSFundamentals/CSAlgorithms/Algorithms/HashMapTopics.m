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

- (NSArray<NSArray<NSString *> *> *)groupAnagrams:(NSArray<NSString *> *)strs {
    //anagrams是包含的字母完全相同但出现的顺序不同的单词, eat, ate, tea, 排序之后都是aet. 以此排序作为key
    NSMapTable<NSString *, NSMutableArray<NSString *> *> *map = [[NSMapTable alloc] init];
    __block NSMutableArray<NSArray<NSString *> *> *anagramsGroup = [[NSMutableArray alloc] init];
    for (NSUInteger i = 0; i < [strs count]; i++) {
        NSString *word = [NSString stringWithString:strs[i]];
        NSString *key = [self stringSort:word]; //将单词按字母排序之后作为key
        if ([[[map keyEnumerator] allObjects] containsObject:key]) { //包含key,则把word加入key对应的组
            NSMutableArray *value = [map objectForKey:key];
            [value addObject:strs[i]];
        } else {
            NSMutableArray *value = [[NSMutableArray alloc] init];
            [value addObject:strs[i]];
            [map setObject:value forKey:key];
        }
    }
    NSArray<NSString *> *keys = [[map keyEnumerator] allObjects];
    [keys enumerateObjectsUsingBlock:^(NSString * _Nonnull key, NSUInteger idx, BOOL * _Nonnull stop) {
        NSArray<NSString *> *anagrams = [map objectForKey:key];
        [anagramsGroup addObject:anagrams];
    }];
    
    return  anagramsGroup;
}

- (NSString *)stringSort:(NSString *)str {
    if ([str isEqualToString:@""]) {
        return @"";
    }
    
    NSMutableArray *chArr = [[NSMutableArray alloc] init]; //str每个字母存在数组中,通过数组对象排序元素再转换成字符串对象
    for (NSUInteger i = 0; i < str.length; i++) {
        NSString *ch = [NSString stringWithFormat:@"%c", [str characterAtIndex:i]];
        [chArr addObject:ch];
    }
    NSArray *sortChArr = [chArr sortedArrayUsingSelector:@selector(compare:)];
    __block NSMutableString *result = [[NSMutableString alloc] init];
    [sortChArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [result appendString:obj];
    }];
    return result;
}

- (NSArray<NSArray<NSString *> *> *)groupAnagramsWithStringKey:(NSArray<NSString *> *)strs {
    //用单词出现的次数构建key
    NSMapTable<NSString *, NSMutableArray<NSString *> *> *map = [[NSMapTable alloc] init];
    __block NSMutableArray<NSArray<NSString *> *> *anagramsGroup = [[NSMutableArray alloc] init];
    for (NSUInteger i = 0; i < [strs count]; i++) {
        NSString *word = [NSString stringWithString:strs[i]];
        NSString *key = [self toArrayKey:word]; //将单词按字母排序之后作为key
        if ([[[map keyEnumerator] allObjects] containsObject:key]) { //包含key,则把word加入key对应的组
            NSMutableArray *value = [map objectForKey:key];
            [value addObject:strs[i]];
        } else {
            NSMutableArray *value = [[NSMutableArray alloc] init];
            [value addObject:strs[i]];
            [map setObject:value forKey:key];
        }
    }
    NSArray<NSString *> *keys = [[map keyEnumerator] allObjects];
    [keys enumerateObjectsUsingBlock:^(NSString * _Nonnull key, NSUInteger idx, BOOL * _Nonnull stop) {
        NSArray<NSString *> *anagrams = [map objectForKey:key];
        [anagramsGroup addObject:anagrams];
    }];
    
    return  anagramsGroup;
}

- (NSString *)toArrayKey:(NSString *)str {
    //001000..的字符串, 长度是26, 每一位代表str中对应字母出现的次数
    if ([str isEqualToString:@""]) {
        return @"";
    }
    
    //初始化key 26个0
    NSMutableArray<NSNumber *> *key = [[NSMutableArray alloc] init];
    for (NSUInteger i = 0; i < 26; i++) {
        NSNumber *num = [NSNumber numberWithInteger:0];
        [key addObject:num];
    }
    
    for (NSUInteger i = 0; i < str.length; i++) { //生成key
        unichar ch = [str characterAtIndex:i];
        int index = ch - 'a'; //映射到0-25
        key[index] = [NSNumber numberWithInteger:[key[index] integerValue] + 1];
    }
    
    __block NSMutableString *result = [[NSMutableString alloc] init];
    [key enumerateObjectsUsingBlock:^(NSNumber *  _Nonnull nu, NSUInteger idx, BOOL * _Nonnull stop) {
        [result appendString:[NSString stringWithFormat:@"%ld", [nu integerValue]]];
    }];
    return result;
}

- (NSUInteger)lengthOfLongestSubstring:(NSString *)s {
    //通过一个map table记录每个字母出现的次数, 来判断是否出现了重复的字符
    //key-value: ascii字符-出现的次数
    NSMapTable<NSNumber *, NSNumber*> *map = [[NSMapTable alloc] init];
    for (NSUInteger i = 0; i < 128; i++) { //初始化map 128个0 表示所有的ASCII字符, 出现的次数不可能超过2
        NSNumber *index = [NSNumber numberWithInteger:i];
        [map setObject:@0 forKey:index];
    }
    
    //通过两个指针begin和i维护一个滑动窗口
    NSUInteger maxLen = 0, begin = 0; //begin执行不重复字符的子串第一个位置
    BOOL isRepeated = NO; //是否有重复的
    NSMutableArray *substring = [[NSMutableArray alloc] init]; //substring保存当前不重复字符的子串
    for (NSUInteger i = 0; i < s.length; i++) { //更新map对应的字符个数+1 及substring
        NSUInteger key = [s characterAtIndex:i];
        NSNumber *value = [map objectForKey:@(key)];
        [map setObject:[NSNumber numberWithInteger:[value integerValue] + 1] forKey:@(key)];
        [substring addObject:[NSString stringWithFormat:@"%c", [s characterAtIndex:i]]];
        
        isRepeated = [[map objectForKey:@(key)] integerValue] > 1;//是否出现重复
        printf("i: %ld %c: %ld ", i, (unichar)key, (long)[[map objectForKey:@(key)] integerValue]);
        //是否移动begin
        while (isRepeated && begin < i) { //出现重复移动指针begin, 并更新map和word
            [substring removeObjectAtIndex:0];
            NSUInteger beginKey = [s characterAtIndex:begin];
            NSNumber *beginValue = [map objectForKey:@(key)];
            [map setObject:[NSNumber numberWithInteger:[beginValue integerValue] - 1] forKey:@(key)];
            begin++;
            isRepeated = [self hasRepeatedString:map];//是否还要重复的字符
        }
        
        printf("sub len: %ld\n", [substring count]);
        if ([substring count] > maxLen) {
            maxLen = [substring count]; //更新最大无重复字符子串的长度
        }
    }
    return maxLen;
}

- (BOOL)hasRepeatedString:(NSMapTable<NSNumber * , NSNumber *> *)map {
    __block BOOL isRepeated = NO;
    [[[map keyEnumerator] allObjects] enumerateObjectsUsingBlock:^(id  _Nonnull key, NSUInteger idx, BOOL * _Nonnull stop) {
        NSNumber *value = [map objectForKey:key];
        if ([value integerValue] > 1) {
            isRepeated = YES;
            *stop = YES;
        }
    }];
    return isRepeated;
}

- (NSArray<NSString *> *)findRepeatedDnaSequences:(NSString *)s {
    NSMutableArray<NSString *> *result = [[NSMutableArray alloc] init];
    //key:value 长度10的子串:出现次数
    NSMapTable<NSString *, NSNumber *> *map = [[NSMapTable alloc] init];
    for (NSUInteger i = 0; i < s.length; i++) { //找出所有长度10的子串
        if (i + 10 < s.length) { //注意需要避免越界
            NSString *sub = [s substringWithRange:NSMakeRange(i, 10)];
            printf("%s\n", [sub UTF8String]);
            if (![[[map keyEnumerator] allObjects] containsObject:sub]) { //保存到map中
                [map setObject:@(1) forKey:sub];
            } else { //map已经包含这个子串,那么其对应的个数+1
                NSInteger cnt = [[map objectForKey:sub] integerValue];
                [map setObject:@(cnt + 1) forKey:sub];
            }
        }
    }
    
    //找出所有长度10的并且次数超过1的子串
    [[[map keyEnumerator] allObjects] enumerateObjectsUsingBlock:^(NSString * _Nonnull sequence, NSUInteger idx, BOOL * _Nonnull stop) {
        NSNumber *num = [map objectForKey:sequence];
        if ([num integerValue] > 1) {
            [result addObject:sequence];
        }
    }];

    return result;
}

- (NSString *)minWindow:(NSString *)s pattern:(NSString *)t {
    //分别保存t、s中各字母及出现的次数
    NSMapTable<NSString *, NSNumber *> *map_t = [[NSMapTable alloc] init];
    NSMapTable<NSString *, NSNumber *> *map_s = [[NSMapTable alloc] init];
    NSMutableString *substring = [[NSMutableString alloc] init];
    NSString *result = @"";
    BOOL isContained = NO; //是否包含了t的全部字符
    NSUInteger begin = 0;// begin和i双指针分别指向当前的子串的开头和结尾
    for (NSUInteger i = 0; i < t.length; i++) { //构建map_t <字符, 出现的次数>
        NSString *ch = [NSString stringWithFormat:@"%c", [t characterAtIndex:i]];
        if ([[[map_t keyEnumerator] allObjects] containsObject:ch]) {
            NSUInteger value = [[map_t objectForKey:ch] integerValue];
            [map_t setObject:@(value + 1) forKey:ch];
        } else {
            [map_t setObject:@(1) forKey:ch];
        }
    }
    printf("map_t:\n");
    [[[map_t keyEnumerator] allObjects] enumerateObjectsUsingBlock:^(NSString * _Nonnull key, NSUInteger idx, BOOL * _Nonnull stop) {
        NSUInteger cnt = [[map_t objectForKey:key] integerValue];
        printf("%c: %ld\n", [key characterAtIndex:0], (long)cnt);
    }];
    
    for (NSUInteger i = 0; i < s.length; i++) {
        //更新map_s
        NSString *ch = [NSString stringWithFormat:@"%c", [s characterAtIndex:i]];
        if ([[[map_s keyEnumerator] allObjects] containsObject:ch]) {
            NSUInteger value = [[map_s objectForKey:ch] integerValue];
            [map_s setObject:@(value + 1) forKey:ch];
        } else {
            [map_s setObject:@(1) forKey:ch];
        }
        printf("map_s:\n");
        [[[map_s keyEnumerator] allObjects] enumerateObjectsUsingBlock:^(NSString * _Nonnull key, NSUInteger idx, BOOL * _Nonnull stop) {
            NSUInteger cnt = [[map_s objectForKey:key] integerValue];
            printf("%c: %ld\n", [key characterAtIndex:0], (long)cnt);
        }];
        [substring appendString:ch];
        
        isContained = [self isContainedAllCharacters:map_s patternMap:map_t];
        while (isContained && begin < i) {
            //更新result
            if ([result isEqualToString:@""] ||
                (![result isEqualToString:@""] && result.length > substring.length)
                ) {
                result = [NSString stringWithFormat:@"%@", substring];//不能直接=,否则是浅拷贝
            }

            //更新map_s、substring和begin向前移动
            NSString *ch = [NSString stringWithFormat:@"%c", [s characterAtIndex:begin]];
            NSUInteger value = [[map_s objectForKey:ch] integerValue];
            [map_s setObject:@(value - 1) forKey:ch];
            begin++;
            [substring deleteCharactersInRange:NSMakeRange(0, 1)];
            isContained = [self isContainedAllCharacters:map_s patternMap:map_t];
        }
    }
    return result;
}

- (BOOL)isContainedAllCharacters:(NSMapTable<NSString *, NSNumber *> *)mapS patternMap:(NSMapTable<NSString *, NSNumber *> *)mapT {
    NSArray<NSString *> *keyS = [[mapS keyEnumerator] allObjects];
    NSArray<NSString *> *keyT = [[mapT keyEnumerator] allObjects];
    if ([keyS count] < [keyT count]) {
        return NO;
    }
    
    __block BOOL isContained = YES;
    [keyT enumerateObjectsUsingBlock:^(NSString * _Nonnull key, NSUInteger idx, BOOL * _Nonnull stop) {
        if (nil == [mapS objectForKey:key]) { //s没有这个key一定不包含
            isContained = NO;
            *stop = YES;
        }
            
        NSInteger cntS = [[mapS objectForKey:key] integerValue];
        NSInteger cntT = [[mapT objectForKey:key] integerValue];
        if (cntS < cntT) { //s的key对应的value个数小也一定不包含
            isContained = NO;
            *stop = YES;
        }
    }];
    return isContained;
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

/*
 //单词匹配 (290)
 NSString *pattern1 = @"abba", *str1 = @"dog cat cat dog";
 BOOL isMatch = [hashMapTopics wordPattern:pattern1 string:str1];
 printf("%s\n", isMatch ? "匹配" : "不匹配");
 NSString *pattern2 = @"abba", *str2 = @"dog cat cat fish";
 isMatch = [hashMapTopics wordPattern:pattern2 string:str2];
 printf("%s\n", isMatch ? "匹配" : "不匹配");
 NSString *pattern3 = @"aaaa", *str3 = @"dog cat cat dog";
 isMatch = [hashMapTopics wordPattern:pattern3 string:str3];
 printf("%s\n", isMatch ? "匹配" : "不匹配");
 NSString *pattern4 = @"abba", *str4 = @"dog dog dog dog";
 isMatch = [hashMapTopics wordPattern:pattern4 string:str4];
 printf("%s\n", isMatch ? "匹配" : "不匹配");
 */

/*
 //分组变位词 (49)
 NSString *str = @"tea";
 NSString *sortStr = [hashMapTopics stringSort:str];
 printf("%s -> %s\n", [str UTF8String], [sortStr UTF8String]);
 NSArray<NSString *> *strs = [NSArray arrayWithObjects:@"tea", @"bat", @"eat", @"tan", @"nat", @"ate", @"kte", @"bat", nil];
 NSArray<NSArray<NSString *> *> *result = [hashMapTopics groupAnagrams:strs];
 [result enumerateObjectsUsingBlock:^(NSArray<NSString *> * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
 [obj enumerateObjectsUsingBlock:^(NSString * _Nonnull word, NSUInteger idx, BOOL * _Nonnull stop) {
 printf("[%s]", [word UTF8String]);
 }];
 printf("\n");
 }];
 */

/*
 //分组变位词 (49) 每个字母出现的次数构建key的方法
 NSString *str = @"aaaaa";
 NSString *sortStr = [hashMapTopics toArrayKey:str];
 printf("%s -> %s\n", [str UTF8String], [sortStr UTF8String]);
 NSArray<NSString *> *strs = [NSArray arrayWithObjects:@"tea", @"bat", @"eat", @"tan", @"nat", @"ate", @"kte", @"bat", nil];
 NSArray<NSArray<NSString *> *> *result = [hashMapTopics groupAnagramsWithStringKey:strs];
 [result enumerateObjectsUsingBlock:^(NSArray<NSString *> * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
 [obj enumerateObjectsUsingBlock:^(NSString * _Nonnull word, NSUInteger idx, BOOL * _Nonnull stop) {
 printf("[%s]", [word UTF8String]);
 }];
 printf("\n");
 }];
 */

/*
 //最长无重复字符的子串 (3)
 NSString *s1 = @"abcbadab";
 NSUInteger len1 = [hashMapTopics lengthOfLongestSubstring:s1];
 printf("%s : %ld\n", [s1 UTF8String], len1);
 
 NSString *s2 = @"aaaaaaa";
 NSUInteger len2 = [hashMapTopics lengthOfLongestSubstring:s2];
 printf("%s : %ld\n", [s2 UTF8String], len2);
 */

/*
 //找出所有长度10且出现次数超过1次的DNA子串 (187)
 NSString *s = @"AAAAACCCCCAAAAACCCCCCAAAAAGGGTTT";
 NSArray<NSString *> *result = [hashMapTopics findRepeatedDnaSequences:s];
 printf("result:\n");
 [result enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
 printf("%s\n", [obj UTF8String]);
 }];
 */

/*
 //最小窗口子串 (76)
 StackQueueHeapTopics *stackQueueHeadTopics = [[StackQueueHeapTopics alloc] init];
 LinkedListTopics *linkedListTopics = [[LinkedListTopics alloc] init];
 DPTopics *dPTopics = [[DPTopics alloc] init];
 StringTopics *stringTopics = [[StringTopics alloc] init];
 GreedyTopics *greedyTopics = [[GreedyTopics alloc] init];
 RecBatkDivConqTopics *recBatkDivConqTopics = [[RecBatkDivConqTopics alloc] init];
 BTreeGraphicTopics *bTreeGraphicTopics = [[BTreeGraphicTopics alloc] init];
 BinarySearchTopics *binarySearchTopics = [[BinarySearchTopics alloc] init];
 HashMapTopics *hashMapTopics = [[HashMapTopics alloc] init];

 NSMapTable<NSString *, NSNumber*> *map_t = [[NSMapTable alloc] init];
 NSMapTable<NSString *, NSNumber*> *map_s = [[NSMapTable alloc] init];
 [map_t setObject:@1 forKey:@"A"];
 [map_t setObject:@1 forKey:@"B"];
 [map_t setObject:@1 forKey:@"C"];
 [map_s setObject:@1 forKey:@"A"];
 [map_s setObject:@1 forKey:@"D"];
 [map_s setObject:@1 forKey:@"O"];
 [map_s setObject:@1 forKey:@"B"];
 [map_s setObject:@1 forKey:@"E"];
 [map_s setObject:@1 forKey:@"C"];
 BOOL isContained = [hashMapTopics isContainedAllCharacters:map_s patternMap:map_t];
 printf("%s\n", isContained? "YES": "NO");

 printf("result:\n");
 NSString *s = @"ADOBECODEBANC";
 NSString *t = @"ABC";
 NSString *r = [hashMapTopics minWindow:s pattern:t];
 printf("s=%s, t=%s, result=%s\n", [s UTF8String], [t UTF8String], [r UTF8String]);

 s = @"MADOBCCABEC";
 t = @"ABCC";
 r = [hashMapTopics minWindow:s pattern:t];
 printf("s=%s, t=%s, result=%s\n", [s UTF8String], [t UTF8String], [r UTF8String]);

 s = @"aa";
 t = @"aa";
 r = [hashMapTopics minWindow:s pattern:t];
 printf("s=%s, t=%s, result=%s\n", [s UTF8String], [t UTF8String], [r UTF8String]);
 */
@end
