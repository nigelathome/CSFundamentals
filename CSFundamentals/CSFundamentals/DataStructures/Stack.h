//
//  Stack.h
//  CSFundamentals
//
//  Created by Hui,Li on 2019/10/7.
//  Copyright © 2019 Hui,Li. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

//定义block @param obj 回调值
typedef void(^StackBlock)(id obj);

@interface Stack : NSObject

//取出栈顶
- (nullable id)top;

//判断栈是否为空
- (BOOL)empty;

//将obj入栈
- (void)push:(id)obj;

//弹出栈顶元素
- (nullable id)pop;

//栈存储的元素个数
- (NSInteger)size;

//从栈底开始遍历 @param block 回调遍历的结果
- (void)enumerateObjectsFromBottom:(StackBlock)block;

//从顶部开始遍历
- (void)enumerateObjectsFromtop:(StackBlock)block;

//所有元素出栈，一边出栈一边返回元素
- (void)enumerateObjectsPopStack:(StackBlock)block;

//清空
- (void)removeAllObjects;

@end

NS_ASSUME_NONNULL_END
