//
//  ReuseCellViewController.m
//  iOSFundamentals
//
//  Created by Hui,Li on 2020/12/13.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#import "ReuseCellViewController.h"
#define CELL_ID @"UITableViewCell"

@interface ReuseCellViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, readwrite) UITableView *tableView;
@property (nonatomic, readwrite) NSMutableSet *cellSet;

@end

@implementation ReuseCellViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"复用机制";
    _cellSet = [[NSMutableSet alloc] init];
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) style:(UITableViewStylePlain)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
}

#pragma mark - tableview delegate method
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CELL_ID];
        [self.cellSet addObject:[NSString stringWithFormat:@"%p", cell]];
    }
    cell.backgroundColor = [UIColor lightTextColor];
    cell.textLabel.text = [NSString stringWithFormat:@"cell地址---%p", cell];
    
    if ([self.cellSet member:[NSString stringWithFormat:@"%p", cell]]) {
        cell.textLabel.textColor = [UIColor purpleColor];
    }
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

@end
