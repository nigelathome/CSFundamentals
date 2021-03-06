//
//  WebViewController.m
//  iOSFundamentals
//
//  Created by Hui,Li on 2021/3/6.
//  Copyright © 2021 Hui,Li. All rights reserved.
//

#import "WebViewController.h"
#import <WebKit/WebKit.h>

@interface WebViewController () <WKNavigationDelegate>

@property (nonatomic, strong) WKWebView *webView;

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"JS的使用";
    
    self.webView.frame = self.view.frame;
    [self.view addSubview:self.webView];
    [self loadWebContent];
}

- (void)loadWebContent {
    NSURL *url = [NSURL URLWithString:@"https://exmail.qq.com/login"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}

#pragma mark - lazy load
- (WKWebView *)webView {
    if (!_webView) {
        _webView = [[WKWebView alloc] init];
        _webView.navigationDelegate = self;
    }
    return _webView;
}

#pragma mark - WKNavigationDelegate
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    NSLog(@"%s", __FUNCTION__);
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    NSLog(@"%s", __FUNCTION__);
    
    /*
     获取网页上元素
     */
    NSString *jsTarget1 = @"document.getElementsByTagName('html')[0].innerHTML";
    [self.webView evaluateJavaScript:jsTarget1 completionHandler:^(id _Nullable data, NSError * _Nullable error) {
        if (!error) {
            NSLog(@"获取html元素 %@", data);
        }
    }];
    
    /*
     修改网页上的文案：登录邮箱->登录企业邮箱123
     */
    NSString *jsTarget2 = @"document.getElementsByClassName('login_title')[0].innerText='登录企业邮箱123'";
    [self.webView evaluateJavaScript:jsTarget2 completionHandler:^(id _Nullable data, NSError * _Nullable error) {
        if (!error) {
            NSLog(@"修改html元素");
        }
    }];
}

- (void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error {
    NSLog(@"%s", __FUNCTION__);
}

@end
