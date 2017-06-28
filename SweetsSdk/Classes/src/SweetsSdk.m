//
//  SweetsSdk.m
//  SweetsSdk
//
//  Created by Vast on 2017/6/10.
//  Copyright © 2017年 Aiesst. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SweetsSdk.h"
#import "SPayClient.h"
#import "MainViewController.h"
#import "Store.h"
#import "CordovaManager.h"

// 用于保存SweetsViewController
static UIViewController* sweetsViewController;

@implementation SweetsSdk

/**
 生成一个SweetsViewController用于跳转，直接使用框架生成的MainViewController

 @return UIViewController
 */
+ (UIViewController*) sweetsViewControllerWithToken: (NSString*) token {
    // 初始化交换缓冲
    [Store initStore];
    // 设置token
    [Store OcStoreSet:@"token" val:token];
    if(!sweetsViewController) {
        sweetsViewController = [[MainViewController alloc] init];
    } else {
        // 发送给js更新命令
        NSDictionary* dictionary = @{@"cmd":@"token",@"data":token};
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dictionary options:NSJSONWritingPrettyPrinted error:nil];
        if(!jsonData) {
        } else {
            NSString* msg = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
            [CordovaManager sendMsgToCordova:msg CDVViewController:(CDVViewController*)sweetsViewController];
        }
    }
    return sweetsViewController;
}

/**
 app在启动时，需调用该函数进行支付配置，该配置主要用于适配威富通
 
 @param application 参照AppDelegate.m文件，系统参数
 @param launchOptions 参照AppDelegate.m文件，系统参数
 @return 状态
 */
+ (BOOL) application: (UIApplication*)application didFinishLaunchingWithOptions:(NSDictionary*)launchOptions {
    SPayClientWechatConfigModel *wechatConfigModel = [[SPayClientWechatConfigModel alloc] init];
    wechatConfigModel.appScheme = @"wxd3a1cdf74d0c41b3";
    wechatConfigModel.wechatAppid = @"wxd3a1cdf74d0c41b3";
    wechatConfigModel.isEnableMTA =YES;
    
    //配置微信APP支付
    [[SPayClient sharedInstance] wechatpPayConfig:wechatConfigModel];
    
    return [[SPayClient sharedInstance] application:application
               didFinishLaunchingWithOptions:launchOptions];
}

/**
 app在从后台进入时，需要调用该函数来确认支付结果，该配置主要用于适配威富通
 
 @param application 参照AppDelegate.m文件，系统参数
 */
+ (void)applicationWillEnterForeground:(UIApplication *)application {
    [[SPayClient sharedInstance] applicationWillEnterForeground:application];
}

/**
 获取返回消息

 @return 返回消息
 */
+ (NSString*)getReturnMsg {
    return [Store JsStoreGetValByKey:@"return_msg"];
}

@end
