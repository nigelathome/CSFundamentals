//
//  LGExpertInfo+Additional.m
//  iOSFundamentals
//
//  Created by Hui,Li on 2020/12/21.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#import "LGExpertInfo+Additional.h"

@implementation LGExpertInfo (Additional)

- (void)setPreference:(NSString *)preference {
    self.preference = [preference copy];
}

- (NSString *)preference {
    return @"python";
}
@end
