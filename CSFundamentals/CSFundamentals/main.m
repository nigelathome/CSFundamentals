//
//  main.m
//  CSFundamentals
//
//  Created by Hui,Li on 2019/10/2.
//  Copyright © 2019 Hui,Li. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LinkedListTopics.h"
#import "DPTopics.h"
#import "StackQueueTopics.h"
#import "StringTopics.h"
#import "ListNode.h"
#import "Stack.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, US!");
        NSLog(@"Hello, CHINA!");
        
        StackQueueTopics *stackQueueTopics = [StackQueueTopics new];
        LinkedListTopics *linkedListTopics = [LinkedListTopics new];
        DPTopics *dPTopics = [DPTopics new];
        StringTopics *stringTopics = [StringTopics new];
        MyQueue *myQueue = [MyQueue new];
        [myQueue push:[NSNumber numberWithInteger:1]];
        [myQueue push:[NSNumber numberWithInteger:2]];
        [myQueue push:[NSNumber numberWithInteger:3]];
        [myQueue push:[NSNumber numberWithInteger:4]];
        NSLog(@"%d\n", (int)[[myQueue peek] integerValue]);
        [myQueue pop];
        NSLog(@"%d\n", (int)[[myQueue peek] integerValue]);
    }
    return 0;
}
