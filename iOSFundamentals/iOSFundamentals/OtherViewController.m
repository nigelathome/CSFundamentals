//
//  OtherViewController.m
//  iOSFundamentals
//
//  Created by Hui,Li on 2020/12/23.
//  Copyright © 2020 Hui,Li. All rights reserved.
//

#import "OtherViewController.h"
#import "LGPerson.h"
#import "NSObject+LGKVO.h"
#import "GDataXML/GDataXMLNode.h"
#import "MusicModel.h"

extern NSInteger const kAnimationDuration = 3.0f;

@interface OtherViewController () <NSXMLParserDelegate>

@property (nonatomic, strong) LGPerson *person;

@end

@implementation OtherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"其他主题";
    
    NSArray *arr = @[@1, @2, @3, @4, @5, @7, @8];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF > 1 && SELF < 3"];
    NSArray *result = [arr filteredArrayUsingPredicate:predicate];
    LGNSLog(@"%@", result);
    
    //KVC使用
    LGPerson *p1 = [LGPerson new];
    [p1 setValue:@"34" forKey:@"age"];
    [p1 setValue:@"reading" forKey:@"hobby"];
    
    LGPerson *p2 = [LGPerson new];
    [p2 setValue:@"35" forKey:@"age"];
    [p2 setValue:@"writing" forKey:@"hobby"];
    
    LGPerson *p3 = [LGPerson new];
    [p3 setValue:@"30" forKey:@"age"];
    [p3 setValue:@"coding" forKey:@"hobby"];
    
    LGPerson *p4 = [LGPerson new];
    [p4 setValue:@"39" forKey:@"age"];
    [p4 setValue:@"playing" forKey:@"hobby"];
    
    NSArray *ps = @[p1, p2, p3, p4];
    //快速取到每个对象的age属性值
    NSArray *psAge = [ps valueForKey:@"age"];
    //快速求得平均值 还可以有@sum @arg @min @max
    NSNumber *avg = [ps valueForKeyPath:@"@avg.age"];
    NSNumber *sum = [ps valueForKeyPath:@"@sum.age"];
    NSNumber *min = [ps valueForKeyPath:@"@min.age"];
    NSNumber *max = [ps valueForKeyPath:@"@max.age"];
    LGNSLog(@"%@ %@ %@ %@ %@", psAge, avg, min, max, sum);
    
    //KVO的使用
    UILabel *tip = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 200, 50)];
    tip.backgroundColor = [UIColor purpleColor];
    tip.textColor = [UIColor whiteColor];
    tip.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:tip];
    [tip setText:@"点击屏幕触发KVO回调"];
    self.person = [LGPerson new];
    [self setValue:@"35" forKeyPath:@"person.age"];
    [self.person LG_addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionNew context:nil];
    
    /*
     XML文件读写及解析——SAX
     */
    NSString *xml_path = [[NSBundle mainBundle] pathForResource:@"ZYMaterialPlanPayView" ofType:@"xml"];
    NSData *xml_data = [NSData dataWithContentsOfFile:xml_path];
    [self xmlSAXParserWithData:xml_data];
    
    /*
     XML文件读写及解析——DOM
     */
    [self xmlDOMParserWithData:xml_data];
    
    /*
     Json读取和解析
     */
    NSString *json_path = [[NSBundle mainBundle] pathForResource:@"zh" ofType:@"json"];
    NSData *json_data = [NSData dataWithContentsOfFile:json_path];
    [self jsonParserWithData:json_data];
    
    /*
     Json转模型
     */
    
    NSString *music_string = @"{\"status\":200,\"data\":{\"curtime\":\"1469025820\",\"issmarter\":\"0\",\"xmusicnum\":\"3\",\"picurl\":[],\"playlist\":[{\"xqusic_mid\":\"000aB5HG4dioBi \",\"xqusic_id\":\"4831024\",\"xctype\":\"3\",\"xexpire_time\":\"0\",\"xdesc\":\" \",\"xsong_name\":\"海誓山盟亦会分开 \",\"xsinger_name\":\"本兮 \",\"xsong_url\":\"http://stream6.qqmusic.qq.com/16831024.wma \",\"xsong_size\":\"2496570\",\"xsong_playtime\":\"289\",\"xsong_diskname\":\"无底线 \",\"xsong_dissmid\":[\"004LrhoF44bRf2 \",\"004LrhoF44bRf2 \"],\"xsong_dissid\":\"193826\",\"xis_word\":\"0\",\"xcopy_right\":\"0\",\"xsinger_id\":\"4545\",\"xsinger_mid\":\"003LaMHm42u7qS \"},{\"xqusic_mid\":\"0019kz9c1QBWNA \",\"xqusic_id\":\"2633764432\",\"xctype\":\"1\",\"xexpire_time\":\"0\",\"xdesc\":\" \",\"xsinger_name\":\"文艺范电台 \",\"xsong_name\":\"文艺范电台 \",\"xsong_url\":\"http://img.wenyifan.net/20131221/5/1387627094890.mp3 \",\"xsong_size\":\"0\",\"xsong_playtime\":\"0\",\"xsong_diskname\":\"0\",\"xsong_dissmid\":\"0047airw212ppN \",\"xsong_dissid\":\"0\",\"xis_word\":\"-999\",\"xcopy_right\":\"-999\",\"xsinger_id\":\"-999\"},{\"xqusic_mid\":\"001rVHgt15aRmM \",\"xqusic_id\":\"699379606\",\"xctype\":\"5\",\"xexpire_time\":\"0\",\"xdesc\":\" \",\"xsinger_name\":\"soso \",\"xsong_name\":\"8446666&#46;mp3 \",\"xsong_url\":\"http://streamrdt.music.qq.com/8138.83a798500d5cb2b63f442ec3ee215a8d/1081067841469025820/8138.83a798500d.html \",\"xsong_size\":\"0\",\"xsong_playtime\":\"0\",\"xsong_diskname\":\"0\",\"xsong_dissmid\":\"0047airw212ppN \",\"xsong_dissid\":\"0\",\"xis_word\":\"-999\",\"xcopy_right\":\"-999\",\"xsinger_id\":\"-999\"}],\"systemtime\":\"1469025820\"},\"type\":\"json\"}";
    MusicModel *music = [MusicModel mj_objectWithKeyValues:music_string];
    LGNSLog(@"%@ %@", music.type, music.data.playlist[0].xsong_name);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.person.age = rand();
}

#pragma mark - KVO callback
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    LGNSLog(@"KVO 观察到属性值 %@ %@", keyPath, change);
}

#pragma mark - XML/JSON
- (void)xmlSAXParserWithData:(NSData *)data {
    /*
     使用apple提供的XML解析方法
     */
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:data];
    parser.delegate = self;
    [parser parse];
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(nullable NSString *)namespaceURI qualifiedName:(nullable NSString *)qName attributes:(NSDictionary<NSString *, NSString *> *)attributeDict {
    if ([elementName isEqualToString:@"outlet"]) {
        LGNSLog(@"%@", attributeDict);
    }
}

- (void)xmlDOMParserWithData:(NSData *)data {
    NSError *err;
    GDataXMLDocument *doc = [[GDataXMLDocument alloc] initWithData:data options:0 error:&err];
    GDataXMLElement *root = doc.rootElement;
    NSArray *elements = [root elementsForName:@"objects"];
    if ([elements count]>0) {
        for (GDataXMLElement *el in elements) {
            NSArray *children = el.children;
            for (GDataXMLNode *node in children) {
                if ([node.name isEqualToString:@"view"]) {
                    LGNSLog(@"%@", node);
                }
            }
        }
    }
}

- (void)jsonParserWithData:(NSData *)data {
    NSError *error;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error];
    LGNSLog(@"解析json文件：%@", dic);
}

@end
