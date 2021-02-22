//
//  DatabaseViewController.m
//  iOSFundamentals
//
//  Created by Hui,Li on 2021/2/19.
//  Copyright © 2021 Hui,Li. All rights reserved.
//

#import "DatabaseViewController.h"
#import "DBManager.h"

@interface DatabaseViewController ()

@end

@implementation DatabaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"DB的使用";
    
    [[DBManager sharedDBManager] createDB];
    [[DBManager sharedDBManager] createTable];
    
    LGEmployee *employee1 = [LGEmployee new];
    employee1.name = @"nigelli";
    employee1.age = 32;
    
    LGEmployee *employee2 = [LGEmployee new];
    employee2.name = @"jianhu";
    employee2.age = 33;
    
    LGEmployee *employee3 = [LGEmployee new];
    employee3.name = @"frankcao";
    employee3.age = 38;
    
    [[DBManager sharedDBManager] insertEmployee:employee1];
    [[DBManager sharedDBManager] insertEmployee:employee2];
    [[DBManager sharedDBManager] insertEmployee:employee3];
    
    NSArray *arr = [[DBManager sharedDBManager] allEmployees];
    LGNSLog(@"%@", arr);
    
    employee3.name = @"puckshuang";
    employee3.epl_id = 3;
    [[DBManager sharedDBManager] updateEmployee:employee3];
    arr = [[DBManager sharedDBManager] allEmployees];
    LGNSLog(@"%@", arr);
    
    [[DBManager sharedDBManager] deleteEmployee:employee3];
    arr = [[DBManager sharedDBManager] allEmployees];
    LGNSLog(@"%@", arr);
}

@end
