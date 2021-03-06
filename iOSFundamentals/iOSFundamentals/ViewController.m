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
#import "OtherViewController.h"
#import "TimerRelaseViewController.h"
#import "ThreadSafetyViewController.h"
#import "AnimationViewController.h"
#import "Animation2ViewController.h"
#import "Animation3ViewController.h"
#import "Animation4ViewController.h"
#import "Animation5ViewController.h"
#import "ImageDownloadViewController.h"
#import "LockViewController.h"
#import "DatabaseViewController.h"
#import "WebViewController.h"
#import "ProtocolCategoryBlockViewController.h"

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
    }
    cell.textLabel.text = self.dataArray[indexPath.row];
    
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
            break;
        case 10: {
            TimerRelaseViewController *timerRelaseVC = [[TimerRelaseViewController alloc] init];
            [self.navigationController pushViewController:timerRelaseVC animated:YES];
        }
            break;
        case 11: {
            ThreadSafetyViewController *threadSafetyVC = [[ThreadSafetyViewController alloc] init];
            [self.navigationController pushViewController:threadSafetyVC animated:YES];
        }
            break;
        case 12: {
            AnimationViewController *animationVC = [[AnimationViewController alloc] init];
            [self.navigationController pushViewController:animationVC animated:YES];
        }
            break;
        case 13: {
            Animation2ViewController *animation2VC = [[Animation2ViewController alloc] init];
            [self.navigationController pushViewController:animation2VC animated:YES];
        }
            break;
        case 14: {
            Animation3ViewController *animation3VC = [[Animation3ViewController alloc] init];
            [self.navigationController pushViewController:animation3VC animated:YES];
        }
            break;
        case 15: {
            Animation4ViewController *animation4VC = [[Animation4ViewController alloc] init];
            [self.navigationController pushViewController:animation4VC animated:YES];
        }
            break;
        case 16: {
            Animation5ViewController *animation5VC = [[Animation5ViewController alloc] init];
            [self.navigationController pushViewController:animation5VC animated:YES];
        }
            break;
        case 17: {
            ImageDownloadViewController *imageDownloadVC = [[ImageDownloadViewController alloc] init];
            [self.navigationController pushViewController:imageDownloadVC animated:YES];
        }
            break;
        case 18: {
            LockViewController *lockVC = [[LockViewController alloc] init];
            [self.navigationController pushViewController:lockVC animated:YES];
        }
            break;
        case 19: {
            DatabaseViewController *databaseVC = [[DatabaseViewController alloc] init];
            [self.navigationController pushViewController:databaseVC animated:YES];
        }
            break;
        case 20: {
            WebViewController *webVC = [[WebViewController alloc] init];
            [self.navigationController pushViewController:webVC animated:YES];
        }
            break;
        case 21: {
            ProtocolCategoryBlockViewController *ProtocolCategoryBlockVC = [[ProtocolCategoryBlockViewController alloc] init];
            [self.navigationController pushViewController:ProtocolCategoryBlockVC animated:YES];
        }
            break;
        case 22: {
            OtherViewController *otherVC = [[OtherViewController alloc] init];
            [self.navigationController pushViewController:otherVC animated:YES];
        }
            break;
        
        default:
            break;
    }
}

#pragma mark -property
- (NSArray *)dataArray {
    if (!_dataArray) {
        _dataArray = @[@"类和对象", @"GCD的应用", @"block的应用", @"深浅拷贝测试", @"标记指针", @"runloop的应用", @"runtime的应用", @"cell复用机制", @"UI事件响应链", @"内存管理", @"定时器释放", @"线程安全", @"基础动画的应用", @"CALayer子类的应用", @"CoreAnimation框架应用", @"CALayer渲染方法的应用", @"页面卡顿优化应用", @"多线程应用——图片下载",  @"常见锁的使用", @"DB的使用", @"JS的使用", @"协议/分类/block的使用", @"其他主题"];
    }
    return _dataArray;
}

@end
