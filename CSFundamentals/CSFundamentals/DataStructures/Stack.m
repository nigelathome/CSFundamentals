//
//  Stack.m
//  CSFundamentals
//
//  Created by Hui,Li on 2019/10/7.
//  Copyright © 2019 Hui,Li. All rights reserved.
//

#import "Stack.h"

@interface Stack ()

@property(nonatomic)NSMutableArray *stackArray;

@end

@implementation Stack

- (nullable id)top {
    return (![self empty]) ? self.stackArray.lastObject : nil;;
}

- (BOOL)empty {
    return [self.stackArray count] == 0;
}

- (void)push:(id)obj {
    [self.stackArray addObject:obj];
}

- (nullable id)pop {
    if ([self empty]) {
        return nil;
    } else {
        id obj = self.stackArray.lastObject;
        [self.stackArray removeLastObject];
        return obj;
    }
}

- (NSInteger)size {
    return [self.stackArray count];
}

//- (void)enumerateObjectsFromBottom:(StackBlock)block {
//    [self.stackArray enumerateObjectsWithOptions:NSEnumerationConcurrent usingBlock:^(id _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        block ? block(obj) : nil;
//    }];
//}

- (void)enumerateObjectsFromBottom:(StackBlock)block {
    [self.stackArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        block ? block(obj) : nil;
    }];
}

- (void)enumerateObjectsFromtop:(StackBlock)block {
    [self.stackArray enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(id _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop){
        block ? block(obj) : nil;
    }];
}

- (void)enumerateObjectsPopStack:(StackBlock)block {
    __weak typeof(self) weakSelf = self;
    NSUInteger count = self.stackArray.count;
    for (NSUInteger i = count; i > 0; i --) {
        if (block) {
            block(weakSelf.stackArray.lastObject);
            [self.stackArray removeLastObject];
        }
    }
}

- (void)removeAllObjects {
    [self.stackArray removeAllObjects];
}

#pragma mark - lazy
- (NSMutableArray *)stackArray {
    if (!_stackArray) {
        _stackArray = [NSMutableArray array];
    }
    return _stackArray;
}

@end
