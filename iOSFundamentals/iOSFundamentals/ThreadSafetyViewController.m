//
//  ThreadSafetyViewController.m
//  iOSFundamentals
//
//  Created by Hui,Li on 2020/12/27.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#import "ThreadSafetyViewController.h"

@interface ThreadSafetyViewController ()

@property (atomic, assign) NSInteger slice;

@end

@implementation ThreadSafetyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"线程安全";
    
    //线程不安全 slice并没有预期的1000
    dispatch_queue_t queue = dispatch_queue_create("TestQueue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        for (int i=0; i<10000; i++) {
            self.slice = self.slice + 1;
        }
        LGNSLog(@"任务1 %ld", self.slice);
    });
    dispatch_async(queue, ^{
        for (int i=0; i<10000; i++) {
            self.slice = self.slice + 1;
        }
        LGNSLog(@"任务2 %ld", self.slice);
    });
    
    LGNSLog(@"任务3 %ld", self.slice);
}

@end
