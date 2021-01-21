//
//  MusicModel.h
//  iOSFundamentals
//
//  Created by Hui,Li on 2021/1/21.
//  Copyright © 2021 Hui,Li. All rights reserved.
//

#import <Foundation/Foundation.h>
@class PlayModel, DataModel;

NS_ASSUME_NONNULL_BEGIN

@interface MusicModel : NSObject

@property (assign, nonatomic) NSInteger status;
@property (strong, nonatomic) DataModel *data;
@property (copy, nonatomic) NSString *type;

@end


@interface DataModel : NSObject

@property (copy, nonatomic) NSString *curtime;
@property (copy, nonatomic) NSString *issmarter;
@property (copy, nonatomic) NSString *xmusicnum;
@property (strong, nonatomic) NSArray *picurl;
@property (strong, nonatomic) NSArray<PlayModel *> *playlist;
@property (copy, nonatomic) NSString *systemtime;

@end

@interface PlayModel : NSObject

@property (copy, nonatomic) NSString *xqusic_mid;
@property (copy, nonatomic) NSString *xqusic_id;
@property (copy, nonatomic) NSString *xctype;
@property (copy, nonatomic) NSString *xexpire_time;
@property (copy, nonatomic) NSString *xdesc;
@property (copy, nonatomic) NSString *xsong_name;
@property (copy, nonatomic) NSString *xsinger_name;
@property (copy, nonatomic) NSString *xsong_url;
@property (copy, nonatomic) NSString *xsong_size;
@property (copy, nonatomic) NSString *xsong_playtime;
@property (copy, nonatomic) NSString *xsong_diskname;
@property (copy, nonatomic) NSArray<NSString *> *xsong_dissmid;
@property (copy, nonatomic) NSString *xsong_dissid;
@property (copy, nonatomic) NSString *xis_word;
@property (copy, nonatomic) NSString *xcopy_right;
@property (copy, nonatomic) NSString *xsinger_id;
@property (copy, nonatomic) NSString *xsinger_mid;

@end

NS_ASSUME_NONNULL_END
