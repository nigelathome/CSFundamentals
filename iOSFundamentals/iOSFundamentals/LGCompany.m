//
//  LGCompany.m
//  iOSFundamentals
//
//  Created by Hui,Li on 2021/3/7.
//  Copyright © 2021 Hui,Li. All rights reserved.
//

#import "LGCompany.h"

@implementation LGCompany

- (void)doRegularRoutine {
    if (self.delegate && [self.delegate respondsToSelector:@selector(developiOSAPP)]) {
        [self.delegate developiOSAPP];
    }
    if (self.delegate && [self.delegate respondsToSelector:@selector(testiOSAPP)]) {
        [self.delegate testiOSAPP];
    }
    if (self.delegate && [self.delegate respondsToSelector:@selector(doUT)]) {
        [self.delegate doUT];
    }
    if (self.delegate && [self.delegate respondsToSelector:@selector(researchNewTech)]) {
        [self.delegate researchNewTech];
    }
}

- (void)deOptionalWorks {
    if (self.delegate && [self.delegate respondsToSelector:@selector(playBasketBall)]) {
        [self.delegate playBasketBall];
    }
    if (self.delegate && [self.delegate respondsToSelector:@selector(joinTB)]) {
        [self.delegate joinTB];
    }
    if (self.delegate && [self.delegate respondsToSelector:@selector(toBeOutgoing)]) {
        [self.delegate toBeOutgoing];
    }
}

@end
