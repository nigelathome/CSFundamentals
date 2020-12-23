//
//  ScrollSmothViewController.m
//  iOSFundamentals
//
//  Created by Hui,Li on 2020/12/22.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#import "ScrollSmothViewController.h"
#import "LGImageLoader.h"
#import "UITableViewCell+IndexPath.h"

@interface ScrollSmothViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ScrollSmothViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Runloop在滚动流畅上运用";
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 46, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}

- (UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    [cell removeFromSuperview];

    cell.indexPath = indexPath;
    [[LGImageLoader shareInstance] addTask:^BOOL{
        if (![cell.indexPath isEqual:indexPath]) {
            return NO;
        }
        NSString *path = [[NSBundle mainBundle] pathForResource:@"背景图" ofType:@"jpeg"];
        UIImage *image = [UIImage imageWithContentsOfFile:path];
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, cell.bounds.size.width, 400)];
        imageView.image = image;
        [cell.contentView addSubview:imageView];

        return YES;//执行完成
    }];
    
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"背景图" ofType:@"jpeg"];
//    UIImage *image = [UIImage imageWithContentsOfFile:path];
//    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, cell.bounds.size.width, 400)];
//    imageView.image = image;
//    [cell.contentView addSubview:imageView];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 400;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}

@end
