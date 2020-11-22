//
//  RunloopViewController.m
//  iOSFundamentals
//
//  Created by Hui,Li on 2020/11/22.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#import "RunloopViewController.h"

@interface RunloopViewController ()

@end

@implementation RunloopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(print) object:nil];
    [self performSelector:@selector(print) onThread:thread withObject:nil waitUntilDone:NO];
    [thread start];
}

- (void)print {
    NSLog(@"这里");
    NSRunLoop *runloop = [NSRunLoop currentRunLoop];
//    [runloop run];
    NSLog(@"那里");
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
