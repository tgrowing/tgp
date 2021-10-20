//
//  ViewController.m
//  DEMO
//
//  Created by yiqiwang on 2021/3/8.
//  Copyright © 2021 yiqiwang. All rights reserved.
//

#import "ViewController.h"
#import <BeaconAPI_Base/BeaconBaseInterface.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *appkeyTextField;
@property (weak, nonatomic) IBOutlet UITextField *uploadURLTextField;
@property (weak, nonatomic) IBOutlet UITextField *stratergyURLTextField;
@property (weak, nonatomic) IBOutlet UITextField *eventNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *eventParamsTextField;
@property (weak, nonatomic) IBOutlet UILabel *errorLabel;
@property (weak, nonatomic) IBOutlet UIButton *openWebView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.appkeyTextField.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"appkey"];
    self.uploadURLTextField.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"uploadurl"];
    self.stratergyURLTextField.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"stratergyurl"];
    
}


- (IBAction)onSaveClick:(UIButton *)sender {
    [[NSUserDefaults standardUserDefaults] setObject:self.appkeyTextField.text forKey:@"appkey"];
    [[NSUserDefaults standardUserDefaults] setObject:self.uploadURLTextField.text forKey:@"uploadurl"];
    [[NSUserDefaults standardUserDefaults] setObject:self.stratergyURLTextField.text forKey:@"stratergyurl"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (IBAction)onDirectReportClick:(UIButton *)sender {
    NSString *eventName = self.eventNameTextField.text;
    NSString *eventParamsStr = self.eventParamsTextField.text;
    NSDictionary *params = [self getDictionaryFromJson:eventParamsStr];
    [BeaconBaseInterface onDirectUserAction:@"yiqi_test" isSucceed:YES elapse:0 size:0 params:params];
}

- (IBAction)onUndirectReportClick:(UIButton *)sender {
    NSString *eventName = self.eventNameTextField.text;
    NSString *eventParamsStr = self.eventParamsTextField.text;
    NSDictionary *params = [self getDictionaryFromJson:eventParamsStr];
    [BeaconBaseInterface onUserAction:eventName isSucceed:YES elapse:0 size:0 params:params];
}

- (NSDictionary *)getDictionaryFromJson:(NSString *)jsonStr {
    if (jsonStr.length == 0) {
        return [NSDictionary new];
    }
    NSError *error;
    NSData *data = [jsonStr dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *retDic = [NSJSONSerialization JSONObjectWithData:data
                                                           options:NSJSONReadingMutableContainers
                                                             error:&error];
    if (error) {
        self.errorLabel.text = error.localizedDescription;
        return [NSDictionary new];
    } else {
        self.errorLabel.text = nil;
    }
    return retDic;
}


- (IBAction)openWebView:(id)sender {
    
}

@end
