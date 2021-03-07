//
//  LGCompany.h
//  iOSFundamentals
//
//  Created by Hui,Li on 2021/3/7.
//  Copyright © 2021 Hui,Li. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/*
 定义公司的协议
 */
@protocol LGCompanyDelegate <NSObject>

@required
- (void)developiOSAPP;
- (void)testiOSAPP;
- (void)doUT;
- (void)researchNewTech;

@optional
- (void)playBasketBall;
- (void)joinTB;
- (void)toBeOutgoing;

@end

@interface LGCompany : NSObject

@property (nonatomic, weak) id<LGCompanyDelegate> delegate;//公司的代理需要遵循公司的协议

- (void)doRegularRoutine;
- (void)deOptionalWorks;

@end

NS_ASSUME_NONNULL_END
