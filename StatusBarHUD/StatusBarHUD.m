//
//  StatusBarHUD.m
//  StatusBar
//
//  Created by GY on 16/6/2.
//  Copyright © 2016年 www.threeTi.com. All rights reserved.
//  1.2.6  版本号 大版本号。功能更新版本号。bug修复版本号
//  增加新功能 bug修复版本号清零
//  变化特别大，内部架构变了很多就在第一个数字前加1

#import "StatusBarHUD.h"
#import "ViewController.h"

@implementation StatusBarHUD

/**
 *  全局的UIWindow
 */
static UIWindow *window_;
/**  定时器  */
static NSTimer *timer_;

/**
 *  显示UIWindow
 */
+ (void)showWindow
{
    CGFloat windowH = 20;
    CGRect frame = CGRectMake(0, -windowH, [UIScreen mainScreen].bounds.size.width, windowH);
    
    // 显示窗口
    window_.hidden = YES;
    window_ = [[UIWindow alloc] init];
    window_.frame = frame;
    window_.backgroundColor = [UIColor blackColor];
    window_.windowLevel = UIWindowLevelAlert;
    window_.hidden = NO;
    
    frame.origin.y = 0;
    [UIView animateWithDuration:0.25 animations:^{
        
        window_.frame = frame;
        
    }];
}

+ (void)showMessage:(NSString *)msg image:(UIImage *)image
{
    // 停止定时器
    [timer_ invalidate];
    
    // 显示窗口
    [self showWindow];
    
    // 添加按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = window_.bounds;
    button.titleLabel.font = [UIFont systemFontOfSize:12];
    [button setTitle:msg forState:UIControlStateNormal];
    
    if (image) {
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        [button setImage:image forState:UIControlStateNormal];
    }
    
    [window_ addSubview:button];
    
    // 定时小时 2.0s后隐藏
    timer_ = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(hide) userInfo:nil repeats:NO];
}

/**
 *  显示成功信息
 */
+ (void)showSuccess:(NSString *)msg
{
    [self showMessage:msg image:[UIImage imageNamed:@"StatusBarHUD.bundle/check"]];//访问bundle里的资源
}

/**
 *  显示失败信息
 */
+ (void)showError:(NSString *)msg
{
    [self showMessage:msg image:[UIImage imageNamed:@"StatusBarHUD.bundle/error"]];

}

/**
 *  显示信息
 */
+ (void)showMessage:(NSString *)msg
{
    [self showMessage:@"成功" image:nil];

}

/**
 *  显示正在处理信息
 */
+ (void)showLoading:(NSString *)msg
{
    // 停止定时器
    [timer_ invalidate];
    timer_ = nil;
    
    [self showWindow];
    
    // 添加文字
    UILabel *label = [[UILabel alloc] init];
    label.font = [UIFont systemFontOfSize:12];
    label.frame = window_.bounds;
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    label.text = msg;
    [window_ addSubview:label];
    
    // 添加圈圈
    UIActivityIndicatorView *loading = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [loading startAnimating];
    CGFloat msgW = [msg sizeWithAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:12]}].width;
    CGFloat centerX = (window_.frame.size.width - msgW) * 0.5 - 20;
    CGFloat centerY = window_.frame.size.height * 0.5;
    loading.center = CGPointMake(centerX, centerY);
    [window_ addSubview:loading];
}

/**
 *  隐藏
 */
+ (void)hide
{
    [UIView animateWithDuration:0.25 animations:^{
    
        CGRect frame = window_.frame;
        frame.origin.y = -window_.frame.size.height;
        window_.frame = frame;
        
    } completion:^(BOOL finished) {
        
        window_ = nil;
        timer_ = nil;
    }];
}



@end
