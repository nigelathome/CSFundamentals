//
//  BuilderViewController.h
//  iOSFundamentals
//
//  Created by nigelli on 2022/1/29.
//  Copyright © 2022 Hui,Li. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HPUserBuilder;
@class HPUser;

typedef void (^HPUserBuilderBlock)(HPUserBuilder * _Nullable builder);

NS_ASSUME_NONNULL_BEGIN

@interface BuilderViewController : UIViewController

@end

@interface HPUser : NSObject

@property (nonatomic, copy) NSString *userId;
@property (nonatomic, copy) NSDate *birthDay;
@property (nonatomic, strong) NSArray *albums;

- (instancetype)userWithBlock:(HPUserBuilderBlock)block;

@end

@interface HPUserBuilder : NSObject

@property (nonatomic, copy) NSString *userId;
@property (nonatomic, copy) NSDate *birthDay;
@property (nonatomic, strong) NSArray *albums;

- (HPUser *)build;

@end

NS_ASSUME_NONNULL_END
