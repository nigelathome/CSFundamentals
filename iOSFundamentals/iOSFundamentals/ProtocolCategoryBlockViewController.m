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
    
    /*
     block的使用
     */
    ^{//只是定义没有调用block
        LGNSLog(@"this is a no name block");
    };
    //无参数无返回值
    void (^myBlock)(void) = ^{
        LGNSLog(@"this is a block");
    };
    myBlock();//block调用
    //有参数有返回值
    NSInteger (^addBlock)(NSInteger, NSInteger) = ^(NSInteger a, NSInteger b) {
        return a + b;
    };
    NSInteger sum = addBlock(3, 4);
    LGNSLog(@"addBlock %ld", sum);
    //捕获外部变量
    NSInteger additonalValue= 5;
    NSInteger (^calcValue)(NSInteger) = ^(NSInteger val) {
        return val * additonalValue;
    };
    NSInteger result = calcValue(7);
    LGNSLog(@"calcValue %ld", result);
    //修改外部变量
    __block NSInteger baseValue = 10;
    NSInteger (^modifyBlock)(NSInteger) = ^(NSInteger val) {
        baseValue *= val;
        return baseValue;
    };
    baseValue = modifyBlock(5);
    LGNSLog(@"modifyBlock %ld", baseValue);
    //block生命周期
    NSInteger v1 = 7, v2 = 5;
    NSInteger (^getBiggerBlock)(void);
    if (v1 < v2) {
        getBiggerBlock = [^{
            return v2;
        } copy];
    } else {
        getBiggerBlock = [^{
            return v1;
        } copy];
    }
    NSInteger bigger = getBiggerBlock();
    LGNSLog(@"modifyBlock %ld",bigger);
    //block作为函数赋值给成员变量
    self.biggerBlock = getBiggerBlock;
    LGNSLog(@"modifyBlock %ld", self.biggerBlock());
}

@end
