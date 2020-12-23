//
//  OtherViewController.m
//  iOSFundamentals
//
//  Created by Hui,Li on 2020/12/23.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#import "OtherViewController.h"
#import "LGPerson.h"

@interface OtherViewController ()

@property (nonatomic, strong) LGPerson *person;

@end

@implementation OtherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"其他主题";
    
    NSArray *arr = @[@1, @2, @3, @4, @5, @7, @8];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF > 1 && SELF < 3"];
    NSArray *result = [arr filteredArrayUsingPredicate:predicate];
    LGNSLog(@"%@", result);
    
    //KVC使用
    LGPerson *p1 = [LGPerson new];
    [p1 setValue:@"34" forKey:@"age"];
    [p1 setValue:@"reading" forKey:@"hobby"];
    
    LGPerson *p2 = [LGPerson new];
    [p2 setValue:@"35" forKey:@"age"];
    [p2 setValue:@"writing" forKey:@"hobby"];
    
    LGPerson *p3 = [LGPerson new];
    [p3 setValue:@"30" forKey:@"age"];
    [p3 setValue:@"coding" forKey:@"hobby"];
    
    LGPerson *p4 = [LGPerson new];
    [p4 setValue:@"39" forKey:@"age"];
    [p4 setValue:@"playing" forKey:@"hobby"];
    
    NSArray *ps = @[p1, p2, p3, p4];
    //快速取到每个对象的age属性值
    NSArray *psAge = [ps valueForKey:@"age"];
    //快速求得平均值 还可以有@sum @arg @min @max
    NSNumber *avg = [ps valueForKeyPath:@"@avg.age"];
    NSNumber *sum = [ps valueForKeyPath:@"@sum.age"];
    NSNumber *min = [ps valueForKeyPath:@"@min.age"];
    NSNumber *max = [ps valueForKeyPath:@"@max.age"];
    LGNSLog(@"%@ %@ %@ %@", psAge, avg, min, max);
    
    //KVO的使用
    UILabel *tip = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 200, 50)];
    tip.backgroundColor = [UIColor purpleColor];
    tip.textColor = [UIColor whiteColor];
    tip.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:tip];
    [tip setText:@"点击屏幕触发KVO回调"];
    self.person = [LGPerson new];
    [self setValue:@"35" forKeyPath:@"person.age"];
    [self.person addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.person.age = rand();
}

#pragma mark - KVO callback
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    LGNSLog(@"KVO 观察到属性值 %@ %@", keyPath, change);
}


@end
