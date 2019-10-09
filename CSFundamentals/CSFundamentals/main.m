//
//  main.m
//  CSFundamentals
//
//  Created by Hui,Li on 2019/10/2.
//  Copyright © 2019 Hui,Li. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LinkedListTopics.h"
#import "ListNode.h"
#import "DPTopics.h"
#import "StackQueueTopics.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        ListNode *a = [[ListNode alloc] initWithValue:1];
        ListNode *b = [[ListNode alloc] initWithValue:2];
        ListNode *c = [[ListNode alloc] initWithValue:3];
        ListNode *d = [[ListNode alloc] initWithValue:4];
        ListNode *e = [[ListNode alloc] initWithValue:5];
        a.next = b;
        b.next = c;
        c.next = d;
        d.next = e;
        
        ListNode *head = [[ListNode alloc] initListNode:a];
        NSLog(@"Before reverse:\n");
        while(head) {
            NSLog(@"%ld\n", (long)head.val);
            head = head.next;
        }
        
        LinkedListTopics *linkedListTopics = [[LinkedListTopics alloc] init];
        head = [linkedListTopics reverseList:a];
        
        NSLog(@"After reverse:\n");
        while(head) {
            NSLog(@"%ld\n", (long)head.val);
            head = head.next;
        }
        
        DPTopics *dPTopics = [[DPTopics alloc] init];
        NSInteger total = [dPTopics climbStairs:4];
        NSLog(@"%ld\n", (long)total);
        
        StackQueueTopics *stackQueueTopics = [StackQueueTopics new];
        NSString *path = @"//";
//        @"//简化linux路径格式，例如将/home/->/home, /a/b/./c->/a/b/c, /a/b/../-> /a, '.'和'..'分别代表当前路径和返回上一个目录"
        NSString *simplifyPath = [stackQueueTopics simplifyPath:path];
        NSLog(@"original path: %@, simpfied path: %@", path, simplifyPath);
    }
    return 0;
}
