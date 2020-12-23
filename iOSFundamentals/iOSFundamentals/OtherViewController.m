//
//  OtherViewController.m
//  iOSFundamentals
//
//  Created by Hui,Li on 2020/12/23.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#import "OtherViewController.h"

@interface OtherViewController ()

@end

@implementation OtherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"其他主题";
    
    NSArray *arr = @[@1, @2, @3, @4, @5, @7, @8];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF > 1 && SELF < 3"];
    NSArray *result = [arr filteredArrayUsingPredicate:predicate];
    LGNSLog(@"%@", result);
}

@end
