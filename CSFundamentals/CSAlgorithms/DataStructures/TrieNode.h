//
//  TrieNode.h
//  CSAlgorithms
//
//  Created by Hui,Li on 2020/11/20.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TrieNode : NSObject

//保存其他节点，child元素为26 对应26个字母a-z
@property (nonatomic, strong) NSDictionary *child;
//是否末尾节点
@property (nonatomic, assign) BOOL isEnd;

//前序遍历trie树
- (void)preorderTrie:(NSInteger)layer;

//获取全部单次
- (void)getWordsFromTrie:(NSMutableString *)words result:(NSMutableArray<NSString *> *)result;

@end

NS_ASSUME_NONNULL_END
