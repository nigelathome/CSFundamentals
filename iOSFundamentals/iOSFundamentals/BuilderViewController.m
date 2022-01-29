//
//  BuilderViewController.m
//  iOSFundamentals
//
//  Created by nigelli on 2022/1/29.
//  Copyright © 2022 Hui,Li. All rights reserved.
//

#import "BuilderViewController.h"

@interface BuilderViewController ()

@end

@interface HPUser ()

- (instancetype)initWithBuilder:(HPUserBuilder *)builder;

@end

@implementation BuilderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    HPUser *user = [[HPUser alloc] userWithBlock:^(HPUserBuilder * _Nullable builder) {
        builder.userId = @"ih2113";
        NSCalendar *cal = [NSCalendar currentCalendar];
        NSDateComponents *components = [[NSDateComponents alloc] init];
        [components setYear:1988];
        [components setMonth:10];
        [components setDay:17];
        builder.birthDay = [cal dateFromComponents:components];
        builder.albums = [NSArray array];
    }];
    LGNSLog(@"user %@, %@ %@", user, user.userId, user.birthDay);
}

@end

@implementation HPUser

- (instancetype)initWithBuilder:(HPUserBuilder *)builder {
    if (self = [super init]) {
        self.userId = builder.userId;
        self.birthDay = builder.birthDay;
        self.albums = builder.albums;
    }
    return self;
}

- (instancetype)userWithBlock:(HPUserBuilderBlock)block {
    HPUserBuilder *builder = [[HPUserBuilder alloc] init];
    block(builder);
    return [builder build];
}

@end

@implementation HPUserBuilder

- (HPUser *)build {
    return [[HPUser alloc] initWithBuilder:self];
}

@end
