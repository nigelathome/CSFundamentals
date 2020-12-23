//
//  CopyViewController.m
//  iOSFundamentals
//
//  Created by Hui,Li on 2020/11/19.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#import "CopyViewController.h"

@interface CopyViewController ()

@end

@implementation CopyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *str = @"加油让自己优秀";
    NSString *str1 = [str copy];
    NSMutableString *str2 = [str mutableCopy];
    NSLog(@"NSString 的copy和mutableCopy");
    NSLog(@"str %p", str);
    NSLog(@"str1 %p", str1);
    NSLog(@"str2 %p", str2);
    printf("Retain Count = %ld %ld %ld\n",
           CFGetRetainCount((__bridge CFTypeRef)(str)),
           CFGetRetainCount((__bridge CFTypeRef)(str1)),
           CFGetRetainCount((__bridge CFTypeRef)(str2)));
    
    NSMutableString *mutableStr = [NSMutableString stringWithString:str];
    NSString *mutableStr1 = [mutableStr copy];
    NSMutableString *mutableStr2 = [mutableStr copy];
    NSMutableString *mutableStr3 = [mutableStr mutableCopy];
    NSLog(@"NSMutableString 的copy和mutableCopy");
    NSLog(@"mutableStr %p", mutableStr);
    NSLog(@"mutableStr1 %p", mutableStr1);
    NSLog(@"mutableStr2 %p", mutableStr2);
    printf("Retain Count = %ld %ld %ld %ld\n",
           CFGetRetainCount((__bridge CFTypeRef)(mutableStr)),
           CFGetRetainCount((__bridge CFTypeRef)(mutableStr1)),
           CFGetRetainCount((__bridge CFTypeRef)(mutableStr2)),
           CFGetRetainCount((__bridge CFTypeRef)(mutableStr3)));
    
    NSArray *array = [[NSArray alloc] initWithObjects:@"测试数组的深浅拷贝和引用计数", nil];
    NSArray *array1 = [array copy];
    NSArray *array2 = [array mutableCopy];
    NSArray *array3 = [array copy];
    NSLog(@"NSArray 的copy和mutableCopy");
    NSLog(@"array %p", array);
    NSLog(@"array1 %p", array1);
    NSLog(@"array2 %p", array2);
    NSLog(@"array3 %p", array3);
    printf("Retain Count = %ld %ld %ld %ld\n",
           CFGetRetainCount((__bridge CFTypeRef)(array)),
           CFGetRetainCount((__bridge CFTypeRef)(array1)),
           CFGetRetainCount((__bridge CFTypeRef)(array2)),
           CFGetRetainCount((__bridge CFTypeRef)(array3)));
    
    NSMutableArray *mutableArr = [[NSMutableArray alloc] initWithObjects:@"测试数组的深浅拷贝和引用计数", nil];
    NSArray *mutableArr1 = [mutableArr copy];
    NSArray *mutableArr2 = [mutableArr mutableCopy];
    NSArray *mutableArr3 = [mutableArr copy];
    NSLog(@"NSArray 的copy和mutableCopy");
    NSLog(@"mutableArr %p", mutableArr);
    NSLog(@"mutableArr1 %p", mutableArr1);
    NSLog(@"mutableArr2 %p", mutableArr2);
    NSLog(@"mutableArr3 %p", mutableArr3);
    printf("Retain Count = %ld %ld %ld %ld\n",
           CFGetRetainCount((__bridge CFTypeRef)(mutableArr)),
           CFGetRetainCount((__bridge CFTypeRef)(mutableArr1)),
           CFGetRetainCount((__bridge CFTypeRef)(mutableArr2)),
           CFGetRetainCount((__bridge CFTypeRef)(mutableArr3)));
    
    
    LGNSLog(@"%@ %d", [str class], [str isKindOfClass:[NSConstantString class]]);
}
@end
