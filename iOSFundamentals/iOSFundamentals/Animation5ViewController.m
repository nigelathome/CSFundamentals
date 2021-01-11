//
//  Animation5ViewController.m
//  iOSFundamentals
//
//  Created by Hui,Li on 2021/1/11.
//  Copyright © 2021 Hui,Li. All rights reserved.
//

#import "Animation5ViewController.h"
#import "MyTableViewCell.h"

@interface Animation5ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation Animation5ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"页面卡顿优化应用";
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}

#pragma mark - uitableview delegate
- (MyTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyTableViewCell"];
    if (!cell) {
        cell = [[MyTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MyTableViewCell"];
    }
    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}

@end
