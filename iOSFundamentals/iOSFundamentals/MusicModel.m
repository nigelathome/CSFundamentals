//
//  MusicModel.m
//  iOSFundamentals
//
//  Created by Hui,Li on 2021/1/21.
//  Copyright © 2021 Hui,Li. All rights reserved.
//

#import "MusicModel.h"

@implementation MusicModel

@end

@implementation PlayModel

@end

@implementation DataModel

+ (NSDictionary *)mj_objectClassInArray {
    return @{@"playlist" : [PlayModel class]};
}

@end
