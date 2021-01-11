//
//  Animation4ViewController.m
//  iOSFundamentals
//
//  Created by Hui,Li on 2021/1/11.
//  Copyright © 2021 Hui,Li. All rights reserved.
//

#import "Animation4ViewController.h"
#import "CustomerView.h"

@interface Animation4ViewController ()

@property (nonatomic, strong) CustomerView *customerView;

@end

@implementation Animation4ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"CALayer渲染方法的应用";
    
    /*
     draw/display 方法调用
     */
    self.customerView = [[CustomerView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.customerView];
    [self.customerView.layer setNeedsDisplay];//不能直接调用display方法 需要通过setNeedDisplay触发
}

@end
