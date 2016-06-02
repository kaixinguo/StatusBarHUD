//
//  ViewController.m
//  StatusBarHudExample
//
//  Created by GY on 16/6/2.
//  Copyright © 2016年 www.threeTi.com. All rights reserved.
//

#import "ViewController.h"
#import "StatusBarHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)success:(id)sender {
    
    [StatusBarHUD showSuccess:@"成功"];
}

- (IBAction)error:(id)sender {
    
    [StatusBarHUD showError:@"失败"];
}

- (IBAction)loading:(id)sender {
    
    [StatusBarHUD showLoading:@"正在加载中"];
}

- (IBAction)msg:(id)sender {
    
    [StatusBarHUD showMessage:@"没有图标"];
}

- (IBAction)hide:(id)sender {
    
    [StatusBarHUD hide];
}


@end
