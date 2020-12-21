//
//  LGExpertInfo+Additional.m
//  iOSFundamentals
//
//  Created by Hui,Li on 2020/12/21.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#import "LGExpertInfo+Additional.h"

@implementation LGExpertInfo (Additional)

static const void *key = "associate_key";

- (void)setPreference:(NSString *)preference {
//    self.preference = [preference copy];
    objc_setAssociatedObject(self, key, preference, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)preference {
    return (NSString*)objc_getAssociatedObject(self, key);
}
@end
