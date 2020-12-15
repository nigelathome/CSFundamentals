//
//  RunloopViewController.m
//  iOSFundamentals
//
//  Created by Hui,Li on 2020/11/22.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#import "RunloopViewController.h"

@interface RunloopViewController ()

@property(nonatomic, readwrite) NSThread * myThread;

@end

@implementation RunloopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    NSThread thread = [[NSThread alloc] initWithTarget:self selector:@selector(print) object:nil];
//    [self performSelector:@selector(print) onThread:thread withObject:nil waitUntilDone:NO];
//    [self.thread start];
    [self runThread];
}

- (void)runThread {
    self.myThread = [[NSThread alloc] initWithTarget:self selector:@selector(onThread) object:nil];
    [self.myThread start];
}

//给子线程添加runloop
- (void)onThread {
    [[NSRunLoop currentRunLoop] addPort:[NSPort new] forMode:NSDefaultRunLoopMode];
    [[NSRunLoop currentRunLoop] run];
}

- (void)print {
    NSLog(@"这里");
    NSRunLoop *runloop = [NSRunLoop currentRunLoop];
//    [runloop run];
    NSLog(@"那里");
}

- (void)doTask {
    LGNSLog(@"%s", __FUNCTION__);
}

//子线程中执行任务 但不需要每次执行完之后就销毁线程 通过runloop实现线程保活
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self performSelector:@selector(doTask) onThread:self.myThread withObject:nil waitUntilDone:NO];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
