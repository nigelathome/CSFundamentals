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
#import "StackQueueHeapTopics.h"
#import "StringTopics.h"
#import "ListNode.h"
#import "Stack.h"
#import "Queue.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, US!");
        NSLog(@"Hello, CHINA!");
        
        StackQueueHeapTopics *stackQueueHeadTopics = [StackQueueHeapTopics new];
        LinkedListTopics *linkedListTopics = [LinkedListTopics new];
        DPTopics *dPTopics = [DPTopics new];
        StringTopics *stringTopics = [StringTopics new];
    
        Queue *order = [Queue new];
//        [order push:[NSNumber numberWithInteger:3]];
//        [order push:[NSNumber numberWithInteger:2]];
//        [order push:[NSNumber numberWithInteger:5]];
//        [order push:[NSNumber numberWithInteger:4]];
//        [order push:[NSNumber numberWithInteger:1]];
        
        [order push:[NSNumber numberWithInteger:5]];
        [order push:[NSNumber numberWithInteger:1]];
        [order push:[NSNumber numberWithInteger:2]];
        [order push:[NSNumber numberWithInteger:4]];
        [order push:[NSNumber numberWithInteger:3]];
        BOOL isvalid = [stackQueueHeadTopics checkIsValidOrder:order];
        NSLog(@"是否合法:%@", @(isvalid));
    }
    return 0;
}
