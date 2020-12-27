//
//  LGSafetyDictionary.h
//  iOSFundamentals
//
//  Created by Hui,Li on 2020/12/27.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LGSafetyDictionary : NSObject

- (void)setObject:(id)anObject forKey:(NSString *)aKey;
- (id)objectForKey:(NSString *)aKey;

@end

NS_ASSUME_NONNULL_END
