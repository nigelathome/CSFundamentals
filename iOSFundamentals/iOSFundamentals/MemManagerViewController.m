//
//  MemManagerViewController.m
//  iOSFundamentals
//
//  Created by Hui,Li on 2020/11/22.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#import "MemManagerViewController.h"
#import "LGPerson.h"
#import "MRCViewController.h"
#import "UIButton+Block.h"

@interface MemManagerViewController ()

//@property (nonatomic, weak) LGBottle *bottle;
@property (nonatomic, strong) LGBottle *bottle; //可以将strong改成weak也是可以的

@end

@implementation MemManagerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"内存管理";
    NSArray *arr = @[@"2"];
//    _objc_autoreleasePoolPrint();
    //    _objc_autoreleasePoolPrint();     // print1
        @autoreleasepool {
    //        appDelegateClassName = NSStringFromClass([AppDelegate class]);
            NSArray *arr = @[@"1"];
            [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                NSArray *arr1 = @[@"2"];
                _objc_autoreleasePoolPrint();
            }];
            NSLog(@"*******************************");
            _objc_autoreleasePoolPrint();
            NSLog(@"*******************************");
            for (NSNumber *num in arr) {
                NSArray *arr2 = @[@"2"];
                _objc_autoreleasePoolPrint();
            }
    //        _objc_autoreleasePoolPrint(); // print2
    //        NSObject *p1 = [[[NSObject alloc] init] autorelease];
    //        NSObject *p2 = [[[NSObject alloc] init] autorelease];
    //        _objc_autoreleasePoolPrint(); // print3
        }
    //    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
        _objc_autoreleasePoolPrint();     // print4
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(50, 350, 300, 100)];
    [btn setTitle:@"点击进入MRC测试" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor greenColor];
    [self.view addSubview:btn];
    __weak typeof(self) weakSelf = self;
    [btn handleEvent:UIControlEventTouchUpInside withBlock:^(id  _Nullable sender) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        MRCViewController *vc = [[MRCViewController alloc] init];
        [strongSelf.navigationController pushViewController:vc animated:YES];
    }];
    
    //循环引用
    [self makeRetainCycle];
    
    //内存优化
    [self makeHugeAmount];
}

- (void)makeRetainCycle {
    AA *aa = [AA new];
    BB *bb = [BB new];
    aa.b = bb;
    bb.a = aa;
    
    LGBottle *bottle = [LGBottle new];
    self.bottle = bottle;
    __weak typeof(self) weakSelf = self;
    bottle.myBlock = ^{
        [weakSelf throwBottle];
    };
}

- (void)makeHugeAmount {
    NSMutableArray *arr = [NSMutableArray array];
    for (NSInteger i=0; i<1000000; i++) {
        @autoreleasepool {
            NSString *c = [NSString stringWithFormat:@"%ld", i];
            [arr addObject:c];
        }
    }
    LGNSLog(@"%s callout over", __FUNCTION__);
}

- (void)throwBottle {
    LGNSLog(@"%s", __FUNCTION__);
}

- (void)dealloc {
    LGNSLog(@"%@ release", [self class]);
}

@end

@implementation AA

- (void)dealloc {
    LGNSLog(@"AA object release");
}

@end

@implementation BB

- (void)dealloc {
    LGNSLog(@"BB object release");
}

@end

@implementation LGBottle

@end
