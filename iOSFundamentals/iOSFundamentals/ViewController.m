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
#import "TaggedPointerViewController.h"
#import "MemManagerViewController.h"
#import "RunloopViewController.h"
#import "ClassObjectViewController.h"
#import "RuntimeViewController.h"
#import "ReuseCellViewController.h"
#import "UIEventRespViewController.h"

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
//    printf("ViewController");
//    _objc_autoreleasePoolPrint();
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
            ClassObjectViewController *classObjectVC = [[ClassObjectViewController alloc] init];
            [self.navigationController pushViewController:classObjectVC animated:YES];
        }
            break;
            
        case 1: {
            GCDViewController *gcdVC = [[GCDViewController alloc] init];
            [self.navigationController pushViewController:gcdVC animated:YES];
        }
            break;
        case 2: {
            BlockViewController *blockVC = [[BlockViewController alloc] init];
            [self.navigationController pushViewController:blockVC animated:YES];
        }
            break;
        case 3: {
            CopyViewController *copyVC = [[CopyViewController alloc] init];
            [self.navigationController pushViewController:copyVC animated:YES];
        }
            break;
        case 4: {
            TaggedPointerViewController *taggedPointerVC = [[TaggedPointerViewController alloc] init];
            [self.navigationController pushViewController:taggedPointerVC animated:YES];
        }
            break;
        case 5: {
            RunloopViewController *runloopVC = [[RunloopViewController alloc] init];
            [self.navigationController pushViewController:runloopVC animated:YES];
        }
            break;
        case 6: {
            RuntimeViewController *runtimeVC = [[RuntimeViewController alloc] init];
            [self.navigationController pushViewController:runtimeVC animated:YES];
        }
            break;
        case 7: {
            ReuseCellViewController *reuseCellVC = [[ReuseCellViewController alloc] init];
            [self.navigationController pushViewController:reuseCellVC animated:YES];
        }
            break;
        case 8: {
            UIEventRespViewController *UIEventRespVC = [[UIEventRespViewController alloc] init];
            [self.navigationController pushViewController:UIEventRespVC animated:YES];
        }
            break;
        case 9: {
            MemManagerViewController *memManagerVC = [[MemManagerViewController alloc] init];
            [self.navigationController pushViewController:memManagerVC animated:YES];
        }
            
        default:
            break;
    }
}

#pragma mark -property
- (NSArray *)dataArray {
    if (!_dataArray) {
        _dataArray = @[@"类和对象", @"GCD测试", @"block测试", @"深浅拷贝测试", @"标记指针", @"runloop应用测试", @"runtime应用测试", @"cell复用机制", @"UI事件响应链", @"内存管理"];
    }
    return _dataArray;
}

@end
