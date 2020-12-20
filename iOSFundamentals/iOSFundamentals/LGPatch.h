//
//  LGPatch.h
//  iOSFundamentals
//
//  Created by Hui,Li on 2020/12/20.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LGPatch : NSObject <NSCopying>

+ (LGPatch *)sharedPatch;
- (void)evaluateScript:(NSString *)script;

@end

NS_ASSUME_NONNULL_END
