//
//  CordovaManager.m
//  SweetsSdk
//
//  Created by vast-z on 2017/6/27.
//  Copyright © 2017年 Aiesst. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CordovaManager.h"

// 通信钩子
static CDVInvokedUrlCommand* holdCDVInvokedUrlCommand;

@implementation CordovaManager

+ (void) setHoldCDVInvokedUrlCommand: (CDVInvokedUrlCommand*)command {
    holdCDVInvokedUrlCommand = command;
}

+ (void) sendMsgToCordova: (NSString*)msg CDVViewController:(CDVViewController*) cdvViewController {
    CDVPluginResult *result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString: msg];
    [cdvViewController.commandDelegate sendPluginResult:result callbackId:holdCDVInvokedUrlCommand.callbackId];
}

@end
