//
//  ListNode.h
//  CSAlgorithms
//
//  Created by Hui,Li on 2019/10/2.
//  Copyright © 2019 Hui,Li. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ListNode : NSObject

//关于ARC下，不显示指定属性关键字时，默认关键字：
//1.基本数据类型(值类型）：atomic readwrite assign
//2.OC对象(引用类型）： atomic readwrite strong
@property(nonatomic, assign)NSInteger val;
@property(nonatomic, strong, nullable)ListNode *next;

- (instancetype)initWithValue:(NSInteger)val;
- (instancetype)initListNode:(ListNode *)node;

//求链表长度
- (NSUInteger)get_list_length;

//链表头指针向前移动n步
- (ListNode *)forward_long_list_step:(NSInteger)step;

@end

@interface RandomListNode : ListNode

@property(nonatomic, strong, nullable)RandomListNode *random;

@end

NS_ASSUME_NONNULL_END
