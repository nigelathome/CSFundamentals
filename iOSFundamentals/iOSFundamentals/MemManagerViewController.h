//
//  MemManagerViewController.h
//  iOSFundamentals
//
//  Created by Hui,Li on 2020/11/22.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AA, BB;

NS_ASSUME_NONNULL_BEGIN

@interface MemManagerViewController : UIViewController

@end


@interface  AA : NSObject

@property (nonatomic, strong) BB *b;

@end

@interface BB : NSObject

//@property (nonatomic, strong) AA *a;
@property (nonatomic, weak) AA *a;

@end

NS_ASSUME_NONNULL_END
