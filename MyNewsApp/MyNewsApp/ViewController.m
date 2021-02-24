//
//  ViewController.m
//  MyNewsApp
//
//  Created by Hui,Li on 2021/2/24.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:({
        UILabel *label = [[UILabel alloc] init];
        label.text = @"hello world!";
        [label sizeToFit];
        label.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
        label;
    })];
}

@end
