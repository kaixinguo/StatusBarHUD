//
//  StatusBarHUD.h
//  StatusBar
//
//  Created by GY on 16/6/2.
//  Copyright © 2016年 www.threeTi.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface StatusBarHUD : NSObject

/**
 *  显示文字和图片信息
 *  @param msg 文字
 */
+ (void)showMessage:(NSString *)msg image:(UIImage *)image;

/**
 *  显示成功信息
 */
+ (void)showSuccess:(NSString *)msg;

/**
 *  显示失败信息
 */
+ (void)showError:(NSString *)msg;

/**
 *  显示成功信息
 */
+ (void)showMessage:(NSString *)msg;

/**
 *  显示正在处理信息
 */
+ (void)showLoading:(NSString *)msg;

/**
 *  隐藏
 */
+ (void)hide;


@end
