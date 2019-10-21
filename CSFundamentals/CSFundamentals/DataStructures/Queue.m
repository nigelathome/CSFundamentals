//
//  Queue.m
//  CSFundamentals
//
//  Created by Hui,Li on 2019/10/18.
//  Copyright © 2019 Hui,Li. All rights reserved.
//

#import "Queue.h"

@interface Queue()

@property(nonatomic)NSMutableArray *queueArray;

@end

@implementation Queue

- (nullable id)back {
    if ([self empty])
        return nil;
    return [self.queueArray lastObject];
}

- (BOOL)empty {
    return [self.queueArray count] == 0;
}

- (nullable id)front {
    if ([self empty])
        return nil;
    return [self.queueArray firstObject];
}

- (void)pop {
    [self.queueArray removeObjectAtIndex:0];
}

- (void)push:(id)obj {
    [self.queueArray addObject:obj];
}

- (NSInteger)size {
    return [self.queueArray count];
}

- (void)removeAllObjects {
    [self.queueArray removeAllObjects];
}

#pragma mark - lazy
- (NSMutableArray *)queueArray {
    if (!_queueArray) {
        _queueArray = [NSMutableArray array];
    }
    return _queueArray;
}

@end

@interface PriorityQueue()

- (NSArray *)heaplifyFromUpToDown;//小顶堆

@property(nonatomic)NSMutableArray<NSNumber*> *queueArray;
    
@end

@implementation PriorityQueue

- (NSMutableArray<NSNumber*> *)heaplifyFromUpToDown {
    if ([self.queueArray count] == 0){
        return nil;
    }
    NSMutableArray<NSNumber*> *heap = self.queueArray;
    NSInteger i = 0, j = 2*i;
    NSInteger len = [heap count];
    while (j<=len) {
        if (j+1 < len && [heap[j] integerValue] > [heap[j+1] integerValue]) j+=1;
        if ([heap[i] integerValue] > [heap[j] integerValue]){
            [self swap:heap[i] with:heap[j]];
        }
        i = j;
        j = i*2;
    }
    return heap;
}

- (void)swap:(NSNumber*)num1 with:(NSNumber*)num2 {
    NSNumber *temp = num1;
    num1= num2;
    num2 = temp;
}

- (NSNumber*)back {
    if ([self empty])
        return nil;
    return [self.queueArray lastObject];
}

- (BOOL)empty {
    return [self.queueArray count] == 0;
}

- (NSNumber*)front {
    if ([self empty])
        return nil;
    return [self.queueArray firstObject];
}

- (void)pop {
    [self.queueArray removeObjectAtIndex:0];
}

- (void)push:(NSNumber*)obj {
    [self.queueArray addObject:obj];
    [self heaplifyFromUpToDown];//调整堆
}

- (NSInteger)size {
    return [self.queueArray count];
}

- (void)removeAllObjects {
    [self.queueArray removeAllObjects];
}

#pragma mark - lazy
- (NSMutableArray<NSNumber*>*)queueArray {
    if (!_queueArray) {
        _queueArray = [NSMutableArray array];
    }
    return _queueArray;
}


@end
