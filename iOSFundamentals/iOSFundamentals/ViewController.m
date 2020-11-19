//
//  ViewController.m
//  iOSFundamentals
//
//  Created by Hui,Li on 2020/5/7.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#import "ViewController.h"
#import "GCDViewController.h"
#import "BlockViewController.h"
#import "CopyViewController.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, readwrite) UITableView *tableView;
@property (nonatomic, readwrite) NSArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:({
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView;
    })];
}

#pragma mark tableview delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mineTableViewCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"mineTableViewCell"];
        cell.textLabel.text = self.dataArray[indexPath.row];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0: {
            GCDViewController *gcdVC = [[GCDViewController alloc] init];
            [self.navigationController pushViewController:gcdVC animated:YES];
        }
            break;
        case 1: {
            BlockViewController *blockVC = [[BlockViewController alloc] init];
            [self.navigationController pushViewController:blockVC animated:YES];
        }
            break;
        case 2: {
            CopyViewController *copyVC = [[CopyViewController alloc] init];
            [self.navigationController pushViewController:copyVC animated:YES];
        }
            
        default:
            break;
    }
}

#pragma mark -property
- (NSArray *)dataArray {
    if (!_dataArray) {
        _dataArray = @[@"GCD测试", @"block测试", @"深浅拷贝测试", @"属性和成员变量", @"Runtime", @"Runloop", @"循环引用测试"];
    }
    return _dataArray;
}

@end
