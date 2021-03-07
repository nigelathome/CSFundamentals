//
//  ProtocolCategoryBlockViewController.m
//  iOSFundamentals
//
//  Created by Hui,Li on 2021/3/7.
//  Copyright © 2021 Hui,Li. All rights reserved.
//

#import "ProtocolCategoryBlockViewController.h"
#import "LGCompany.h"
#import "LGStaff.h"
#import "LGStaff+TeamLeader.h"

@interface ProtocolCategoryBlockViewController ()

@property (nonatomic, strong) LGCompany *company;
@property (nonatomic, strong) LGStaff *stafff;

@end

@implementation ProtocolCategoryBlockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"协议/分类/block的使用";
    
    /*
     委托-代理的使用
     */
    self.company = [[LGCompany alloc] init];
    self.stafff = [[LGStaff alloc] init];
    self.company.delegate = self.stafff;//设置staff是委托company的代理
    [self.company doRegularRoutine];
    
    /*
     分类中可以定义只读的属性 并且可以正常使用。因为本质没有增加成员变量
     */
    LGNSLog(@"%@", self.stafff.title);
}

@end
