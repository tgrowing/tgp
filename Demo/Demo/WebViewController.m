//
//  WebViewController.m
//  Demo
//
//  Created by zacardfang on 2021/10/20.
//  Copyright © 2021 yiqiwang. All rights reserved.
//

#import "WebViewController.h"
#import <WebKit/WebKit.h>

@interface WebViewController ()
@property (weak, nonatomic) IBOutlet UITextField *urlTextView;
@property (weak, nonatomic) IBOutlet UIButton *openUrlBtn;
@property (weak, nonatomic) IBOutlet WKWebView *webView;

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self.webView evaluateJavaScript:@"navigator.userAgent" completionHandler:^(id result, NSError *error) {
        NSString *newUserAgent = [NSString stringWithFormat:@"%@ %@", result, @"isApp"];
        [self.webView setCustomUserAgent:newUserAgent];
      }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)openUrl:(id)sender {
    NSString *url = _urlTextView.text ? _urlTextView.text : @"";
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:url]]];
    
    [_urlTextView resignFirstResponder];
}

@end
