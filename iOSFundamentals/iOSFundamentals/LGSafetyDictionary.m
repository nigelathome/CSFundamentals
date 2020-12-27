//
//  LGSafetyDictionary.m
//  iOSFundamentals
//
//  Created by Hui,Li on 2020/12/27.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#import "LGSafetyDictionary.h"

@interface LGSafetyDictionary ()

@property (nonatomic, strong) NSMutableDictionary *data;
@property (nonatomic, strong) dispatch_queue_t operatonQueue;

@end

@implementation LGSafetyDictionary

- (instancetype)init {
    if (self = [super init]) {
        _data = [NSMutableDictionary dictionary];
        _operatonQueue = dispatch_queue_create("operaton.queue", DISPATCH_QUEUE_CONCURRENT);
    }
    return self;
}

- (void)setObject:(id)anObject forKey:(NSString *)aKey {
    dispatch_barrier_async(_operatonQueue, ^{
        [self->_data setObject:anObject forKey:aKey];
    });
}

- (id)objectForKey:(NSString *)aKey {
    __block id obj;
    dispatch_sync(_operatonQueue, ^{
        obj = [self->_data objectForKey:aKey];
    });
    return obj;
}

@end
