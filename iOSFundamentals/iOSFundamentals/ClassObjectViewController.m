//
//  ClassObjectViewController.m
//  iOSFundamentals
//
//  Created by Hui,Li on 2020/11/25.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#import "ClassObjectViewController.h"
#import "LGPerson.h"

@interface ClassObjectViewController ()

@end

@implementation ClassObjectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"类和对象";
    LGPerson *p1 = [LGPerson alloc];
    p1.name = @"Cocoi";
    p1.age = 18;
    p1.height = 185;
    p1.hobby = @"女";
    LGNSLog(@"%@", p1);
//    LGPerson *p2 = [p1 init];
//    LGPerson *p3 = [p1 init];
//    LGNSLog(@"%@ - %p", p1, &p1);
//    LGNSLog(@"%@ - %p", p2, &p2);
//    LGNSLog(@"%@ - %p", p3, &p3);
    
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
