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

//向下调整
- (void)siftDown:(NSInteger)parent;

//向上调整
- (void)siftUp:(NSInteger)child;

// value1是否大于value2
- (BOOL)cmp:(NSNumber*)value1 with:(NSNumber*)value2; //小顶堆

@property(nonatomic)NSMutableArray<NSNumber*> *queueArray;
    
@end

@implementation PriorityQueue

- (void)siftUp:(NSInteger)child {
    assert(child>0 && child < [self.queueArray count]);
    NSInteger parent = (child-1)/2; //下标从0开始
    while(child>0){
        if([self cmp:self.queueArray[parent] with:self.queueArray[child]]){
            [self.queueArray exchangeObjectAtIndex:parent withObjectAtIndex:child];
            child = parent;
            parent = (child-1)/2;
        } else {
            break;
        }
    }
}

- (void)siftDown:(NSInteger)parent {
    NSInteger child = parent *2 +1;
    while (child<[self.queueArray count]) {
        if (child+1<[self.queueArray count] &&
            [self cmp:self.queueArray[child] with:self.queueArray[child+1]])
            child++;
        if ([self cmp:self.queueArray[parent] with:self.queueArray[child]]){
            [self.queueArray exchangeObjectAtIndex:parent withObjectAtIndex:child];
            parent = child;
            child = parent*2+1;
        } else {
            break;
        }
    }
}

- (BOOL)cmp:(NSNumber*)value1 with:(NSNumber*)value2 {
    if (self.isSmallHeap) {
        return [value1 integerValue] > [value2 integerValue];//小顶堆
    } else {
        return [value1 integerValue] <= [value2 integerValue];//大顶堆
    }
    //    return [value1 integerValue] < [value2 integerValue];//大顶堆
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
    [self siftDown:0];
}

- (void)push:(NSNumber*)obj {
    [self.queueArray addObject:obj];
    NSInteger size = [self.queueArray count];
    if (size > 1) {
        [self siftUp:(size-1)];
    }
}

- (NSInteger)size {
    return [self.queueArray count];
}

- (void)removeAllObjects {
    [self.queueArray removeAllObjects];
}

- (void)printObjects {
    [self.queueArray enumerateObjectsUsingBlock:^(NSNumber * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx == 0) {
            printf("%ld", (long)[obj integerValue]);
        } else {
            printf("->%ld", (long)[obj integerValue]);
        }
    }];
    printf("\n");
}

#pragma mark - lazy
- (NSMutableArray<NSNumber*>*)queueArray {
    if (!_queueArray) {
        _queueArray = [NSMutableArray array];
    }
    return _queueArray;
}

#pragma mark test-code
/*
 PriorityQueue *priorityQueue = [PriorityQueue new];
 [priorityQueue push:[NSNumber numberWithInteger:4]];
 NSLog(@"top = [%d]\n", (int)[[priorityQueue front] integerValue]);
 [priorityQueue printObjects];
 NSLog(@"=======================================================");
 
 [priorityQueue push:[NSNumber numberWithInteger:3]];
 NSLog(@"top = [%d]\n", (int)[[priorityQueue front] integerValue]);
 [priorityQueue printObjects];
 NSLog(@"=======================================================");
 
 [priorityQueue push:[NSNumber numberWithInteger:2]];
 NSLog(@"top = [%d]\n", (int)[[priorityQueue front] integerValue]);
 [priorityQueue printObjects];
 NSLog(@"=======================================================");
 
 [priorityQueue push:[NSNumber numberWithInteger:1]];
 NSLog(@"top = [%d]\n", (int)[[priorityQueue front] integerValue]);
 [priorityQueue printObjects];
 NSLog(@"=======================================================");
 
 [priorityQueue pop];
 NSLog(@"top = [%d]\n", (int)[[priorityQueue front] integerValue]);
 [priorityQueue printObjects];
 NSLog(@"=======================================================");
 
 [priorityQueue push:[NSNumber numberWithInteger:0]];
 NSLog(@"top = [%d]\n", (int)[[priorityQueue front] integerValue]);
 [priorityQueue printObjects];
 NSLog(@"=======================================================");
 
 [priorityQueue pop];
 NSLog(@"top = [%d]\n", (int)[[priorityQueue front] integerValue]);
 [priorityQueue printObjects];
 NSLog(@"=======================================================");
 
 [priorityQueue pop];
 NSLog(@"top = [%d]\n", (int)[[priorityQueue front] integerValue]);
 [priorityQueue printObjects];
 NSLog(@"=======================================================");
 */

@end
