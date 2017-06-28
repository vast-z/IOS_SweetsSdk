//
//  SweetsSdk.h
//  SweetsSdk
//
//  Created by vast-z on 2017/6/10.
//  Copyright © 2017年 Aiesst. All rights reserved.
//

#import <UIKit/UIKit.h>

//! Project version number for SweetsSdk.
FOUNDATION_EXPORT double SweetsSdkVersionNumber;

//! Project version string for SweetsSdk.
FOUNDATION_EXPORT const unsigned char SweetsSdkVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <SweetsSdk/PublicHeader.h>

@interface SweetsSdk : NSObject

/**
 生成一个SweetsViewController用于展示Sweets客户端界面

 @return Sweets视图控制器
 */
+ (UIViewController*) sweetsViewControllerWithToken: (NSString*) token;

/**
 app在启动时，需调用该函数进行支付配置

 @param application 参照AppDelegate.m文件，系统参数
 @param launchOptions 参照AppDelegate.m文件，系统参数
 @return 状态
 */
+ (BOOL) application: (UIApplication*)application didFinishLaunchingWithOptions:(NSDictionary*)launchOptions;

/**
 app在从后台进入时，需要调用该函数来确认支付结果
 
 @param application 参照AppDelegate.m文件，系统参数
 */
+ (void) applicationWillEnterForeground:(UIApplication *)application;

/**
 获取返回消息，消息类型说明参照对接文档
 
 @return 返回消息
 */
+ (NSString*) getReturnMsg;

@end
