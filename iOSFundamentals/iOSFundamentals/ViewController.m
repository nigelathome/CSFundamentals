//
//  ViewController.m
//  iOSFundamentals
//
//  Created by Hui,Li on 2020/5/7.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#import "ViewController.h"
#import "GCDViewController.h"

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
    InfoType type = [self.dataArray[indexPath.row] integerValue];
    switch (type) {
        case GCD_ISSUE: {
            GCDViewController *gcdVC = [[GCDViewController alloc] init];
            [self.navigationController pushViewController:gcdVC animated:YES];
        }
            break;
            
        default:
            break;
    }
}

#pragma mark -property
- (NSArray *)dataArray {
    if (!_dataArray) {
        _dataArray = @[@"GCD", @"属性和成员变量", @"Runtime", @"Runloop", @"循环引用", @"block"];
    }
    return _dataArray;
}

@end
