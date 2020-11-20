//
//  TaggedPointerViewController.m
//  iOSFundamentals
//
//  Created by Hui,Li on 2020/11/20.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#import "TaggedPointerViewController.h"

@interface TaggedPointerViewController ()

@end

@implementation TaggedPointerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSNumber *num1 = @1;
    NSNumber *num2 = @2;
    NSNumber *num3 = @3;
    NSNumber *numFFFF = @(0xFFFF);
    NSNumber *bigNumber = @(0xEFFFFFFFFFFFFFFF);
    
    NSDate *dateFromNow = [NSDate dateWithTimeIntervalSinceNow:0];
    NSDate *dateFromAnotherDate = [NSDate dateWithTimeInterval:0 sinceDate:[NSDate date]];
    NSDate *dateFromReferenceDate = [NSDate dateWithTimeIntervalSinceReferenceDate:0];
    NSDate *dateFrom1970 = [NSDate dateWithTimeIntervalSince1970:0];
    
    printf("内存地址\n");
    printf("num1 %p\n", num1);
    printf("num2 %p\n", num2);
    printf("num3 %p\n", num3);
    printf("numFFFF %p\n", numFFFF);
    printf("bigNumber %p\n", bigNumber);
    
    printf("\n指针大小\n");
    printf("num1 %zu\n", sizeof(num1));
    printf("num2 %zu\n", sizeof(num2));
    printf("num3 %zu\n", sizeof(num3));
    printf("numFFFF %zu\n", sizeof(numFFFF));
    printf("bigNumber %zu\n", sizeof(bigNumber));
    
    printf("\n内存地址\n");
    printf("dateFromNow %p\n", dateFromNow);
    printf("dateFromAnotherDate %p\n", dateFromAnotherDate);
    printf("dateFromReferenceDate %p\n", dateFromReferenceDate);
    printf("dateFrom1970 %p\n", dateFrom1970);
    
    printf("\n指针大小\n");
    printf("dateFromNow %zu\n", sizeof(dateFromNow));
    printf("dateFromAnotherDate %zu\n", sizeof(dateFromAnotherDate));
    printf("dateFromReferenceDate %zu\n", sizeof(dateFromReferenceDate));
    printf("dateFrom1970 %zu\n", sizeof(dateFrom1970));
    
    NSObject *obj = [[NSObject alloc] init];
    printf("obj %p", obj);
}

@end
